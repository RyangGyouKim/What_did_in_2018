#!/usr/bin/etc python
import cv2
import time
import numpy as np
import region_of_interest
import my_queue
from PIL import Image
import pytesseract
import order_points
import sort_number_plate
import tcp_information
import buzzer
import RPi.GPIO as GPIO

LED_RED = 20
LED_GREEN = 21
GPIO.setmode(GPIO.BCM)
GPIO.setwarnings(False)
GPIO.setup(LED_RED, GPIO.OUT)
GPIO.setup(LED_GREEN, GPIO.OUT)
GPIO.setup(LED_RED, 0)
GPIO.setup(LED_GREEN, 0)


buzzer=buzzer.buzzer(17)

camera  =cv2.VideoCapture(-1)
time.sleep(0.25)
camera.set(cv2.CAP_PROP_FPS, 15)
first_frame= None
frame_buffer_size=15
temp=my_queue.my_queue(frame_buffer_size)
checking_car = False #checking the parking place is empty or not
checking_sending_successfull=False

def extract_contours(threshold_img):
	element = cv2.getStructuringElement(shape=cv2.MORPH_RECT, ksize=(17, 3))
	morph_img_threshold = threshold_img.copy()
	cv2.morphologyEx(src=threshold_img, op=cv2.MORPH_CLOSE, kernel=element, dst=morph_img_threshold)
	cv2.imshow("Morphed",morph_img_threshold)
	cv2.waitKey(0)

	im2,contours, hierarchy= cv2.findContours(morph_img_threshold,mode=cv2.RETR_EXTERNAL,method=cv2.CHAIN_APPROX_NONE)
	return contours

def checking_sub_frames_moving(frame):
    result = True # bool - true or flase 
    for i in range(len(frame)-1):#range(len(frame))==(0,9) -> we don't need i==9
        height, width = frame[i].shape[:2]
        count=0
        for h in range(0,height):
            for w in range(0,width):
                #print("h",w)
                if 255 == frame[i][w][h]:
                    count +=1
        if count<30:
            result=False
            return result
    return result

while True:
    (ret , frame) = camera.read()
    if not ret:
        print("faile to get frame")
        break
    
    h, w = frame.shape[:2]
    vertices = np.array([[30,h-1],[w/5,h/2-h/10+15],[w-w/5,h/2-h/10+15],[w-30,h-1]],np.int32)#for set the Roi 
    Roi_frame = region_of_interest.region_of_interest(frame,[vertices])
    
    gray = cv2.cvtColor(Roi_frame, cv2.COLOR_BGR2GRAY)
    
    if first_frame is None:
        first_frame = gray
        continue
    delta_frame = cv2.absdiff(first_frame, gray)
    
    blur_delta = cv2.GaussianBlur(delta_frame, (3,3), 0)
    ad_th_delta = cv2.adaptiveThreshold(blur_delta,255,cv2.ADAPTIVE_THRESH_MEAN_C,cv2.THRESH_BINARY_INV,21,10)
    Roi_sub_frame0=ad_th_delta[(h//2+h//10)+10:(h//2+h//10)+40, w//2-15:w//2+15]
    Roi_sub_frame1=ad_th_delta[(h//4)*3-10:(h//4*3)+20,w//2-15:w//2+15]
    Roi_sub_frame2=ad_th_delta[(h//4)*3-10:(h//4*3)+20,w//3+25:w//3+55] #second floor from the top
    Roi_sub_frame3=ad_th_delta[(h//4)*3-10:(h//4*3)+20,w//2+51:w//2+81] #second floor from the top
    Roi_sub_frame4=ad_th_delta[(h//4)*3+42:(h//4*3)+72,w//2-15:w//2+15] #third floor from the top
    Roi_sub_frame5=ad_th_delta[(h//4)*3+42:(h//4*3)+72,w//3+25:w//3+55] #third floor from the top
    Roi_sub_frame6=ad_th_delta[(h//4)*3+42:(h//4*3)+72,w//2+51:w//2+81] #third floor from the top
    Roi_sub_frame7=ad_th_delta[(h//4)*3+42:(h//4*3)+72,w//3-40:w//3-10] #third floor from the top
    Roi_sub_frame8=ad_th_delta[(h//4)*3+42:(h//4*3)+72,w//2+117:w//2+147] #third floor from the top
    
    Roi_sub_frames=[]
        
    Roi_sub_frames.append(Roi_sub_frame0)
    Roi_sub_frames.append(Roi_sub_frame1)
    Roi_sub_frames.append(Roi_sub_frame2)
    Roi_sub_frames.append(Roi_sub_frame3)
    Roi_sub_frames.append(Roi_sub_frame4)
    Roi_sub_frames.append(Roi_sub_frame5)
    Roi_sub_frames.append(Roi_sub_frame6)
    Roi_sub_frames.append(Roi_sub_frame7)
    Roi_sub_frames.append(Roi_sub_frame8)
    
    #if 1 -> 차만큼 큰 물체가 모든 roi를 차지하고 있으면 True 
    if checking_sub_frames_moving(Roi_sub_frames):
        #if2 ->차가 처음 입차 했을때 시간 설정
        if checking_car == False:
            print("A car is trying to park")
            parking_time = time.time()
            checking_car = True
        else:
            if (time.time()-parking_time > 5) and (checking_sending_successfull==False):
                print("the car is parked over 5 second")
                blur = cv2.GaussianBlur(gray, (5,5), 0)
                canny=cv2.Canny(blur,20,100)
                (cnts,contours,hierarchy) = cv2.findContours(canny.copy(),cv2.RETR_LIST,cv2.CHAIN_APPROX_SIMPLE)
                sorted_contours = sorted(contours,key = cv2.contourArea, reverse = True)[:5]
                for c in sorted_contours:
                    peri =cv2.arcLength(c,True)
                    approx = cv2.approxPolyDP(c, 0.03 *peri , True)
                 
                    screenCnt = []
                    if len(approx) == 4:
                        contourSize = cv2.contourArea(approx)
                        camSize = frame.shape[0]*frame.shape[1]
                        ratio = contourSize / camSize
                        #if 3 -> 추출된 사각형이 충분이 큰 비율을 가질때 screenCnt 에 그 플레이트의 좌표 저장
                        if ratio < 0.05 and ratio > 0.02:
                            screenCnt =approx
                            break
                if len(screenCnt) == 0:
                    cv2.imshow("Roi_frame",Roi_frame)
                    continue
                else:
                    #if 5 -> 주차 시간이 5초 이상고 ocr이 한번도 실행되지 않았을때 일때 번호판 추출을 한다
                    cv2.drawContours(Roi_frame,c,-1,(0,255,0),3)
                    cv2.imshow("Roi_frame",Roi_frame)
                    ad_th = cv2.adaptiveThreshold(blur,255,cv2.ADAPTIVE_THRESH_MEAN_C,cv2.THRESH_BINARY,21,10)
                    rect = order_points.order_points(screenCnt.reshape(4,2))
                    (topLeft, topRight, bottomRight, bottomLeft) = rect
                    w1 = abs(bottomRight[0] - bottomLeft[0])
                    w2 = abs(topRight[0] - topLeft[0])
                    h1 = abs(topRight[1] - bottomRight[1])
                    h2 = abs(topLeft[1] - bottomLeft[1])
                    maxWidth = max([w1,w2])
                    maxHeight = max([h1,h2])
                    dst = np.float32([[0,0], [maxWidth-1,0],[maxWidth-1,maxHeight-1],[0,maxHeight-1]])
                    M  = cv2.getPerspectiveTransform(rect,dst)
                    warped = cv2.warpPerspective(ad_th, M, (maxWidth,maxHeight))
                    plate_er = Image.fromarray(warped)
                    cv2.imwrite('/home/pi/example_pictures/sent_picture/sent_picture.jpg',frame)
                    cv2.imshow("warped",warped)
                    cv2.imshow("Roi_frame",Roi_frame)
                    result = pytesseract.image_to_string(plate_er, lang='kor')
                    print("result -> ",result)
                    sort_result=sort_number_plate.sort_number_plate(result)
                    print(sort_result)
                    if len(sort_result)==7:
                        checking_sending_successfull=True
                        tcp=tcp_information.tcp_information('25.20.30.103',2620,700000,'/home/pi/example_pictures/sent_picture')
                        tcp.Sever_connect(sort_result)
                        if 'X' in tcp.get_buzzer():
                            GPIO.output(LED_RED, 1)
                            buzzer.hight_output()
                        else:
                            GPIO.output(LED_GREEN,1)              
            else:
                print("parking or just about to go ")
        
    else:
        checking_car=False
        checking_sending_successfull=False
        buzzer.low_output()
        GPIO.output(LED_RED,0)
        GPIO.output(LED_GREEN,0)
        cv2.imshow("Roi_frame",Roi_frame)
        #cv2.imshow("gray",gray)

    key = cv2.waitKey(1) & 0xFF
    if key == 27:
        break
    
camera.release()
GPIO.cleanup()
cv2.destroyAllWindows()

    

