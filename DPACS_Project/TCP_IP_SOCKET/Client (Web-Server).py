# -*- coding: utf-8 -*-
"""
Created on Wed Nov 21 18:11:00 2018

@author: YuJungAhn

Web_Server Python (Final Version)

"""

import socket
import time
import os
import base64
import pymysql.cursors


#1. IP, PORT, BUF_SIZE 설정


#TCP_IP = '192.168.219.171' #집에서 라즈베리 ip 
#TCP_IP = '192.168.219.141' #집에서 ubuntu ip

#TCP_IP = '25.12.156.81' #안유정 노트북 vmware
TCP_IP = '25.20.30.103'  #pi
TCP_PORT = 2620
BUFFER_SIZE = 700000
os.chdir("C:/Users/Ryan/eclipse-workspace/dpacs/WebContent/imgUp")

while 1: #while -1
    while 1 : #while -2
        try:
            #2.소켓생성&경로설정    
            s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
            s.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
            s.connect((TCP_IP, TCP_PORT))

            print('차번호 받기 시도...')

            carNum = s.recv(BUFFER_SIZE)
            carNum = carNum.decode()
            if not carNum:
                continue
            else:
                print("CarNum : ", carNum)
                break

        except Exception as e:  
            print('Server와 연결이 되지 않았습니다.')
            time.sleep(3)
            continue #while -1로 돌아가기


       
    print('파일 서버를 시작합니다.')
          
    
    while 1 :  #while -4
       try:      
           data_len = s.recv(10)
           print('받아야 하는 파일 크기 : ' ,data_len.decode())
           data_len_int = int(data_len)
           
           time.sleep(3)
    
           with open('download', 'wb') as f:
                   try:
                       while data_len_int != 0 :
                            data = s.recv(200000)
                            trans_data = len(data)
                            #print('전송 받은 파일 크기 : ',trans_data)
                            imgdata = base64.b64decode(data, altchars=None, validate=False)
                            f.write(imgdata) 
                            data_len_int -= trans_data
                   except Exception as e: print(e)
    
           print('파일전송종료.')
           
           break
       
       except : 
           continue
     
    time.sleep(3)
   
    # file 이름 바꾸기
    now = time.localtime()
    
    newname = "%04d-%02d-%02d %02dh-%02dm-%02ds 차량번호-%s.jpg" % (now.tm_year, now.tm_mon, now.tm_mday, now.tm_hour, now.tm_min, now.tm_sec, carNum)
    os.rename('download' , newname)
    print('파일명을 %s로 바꿉니다.' %(newname))
   
   
    # DB연결
    conn = pymysql.connect(host='localhost', user='root',
                           password = 'password', db='board')
    try : 
        with conn.cursor() as cursor :
            sql = 'SELECT * FROM dpacs WHERE carNum = %s'
            cursor.execute(sql, (carNum))
            print(carNum+'을 DB와 비교중')
            result = cursor.fetchall()
            for row_data in result:
                print(row_data[0])
                
    except Exception as o: print(o)
   
    #carNum DB와 비교
    if (result == ()) or (row_data[0] == 'X') :
            Buzzer = 'X'
            print ('장애인이 아니거나, 존재하지 않습니다.')
    else :
            Buzzer = 'O'
            print ('장애인이 맞습니다.')
            
   #부저 정보 Server로 보내기.
    while 1 :#while -5
        try :
            s.send(Buzzer.encode('utf-8'))
            print('Server에 Buzzer정보를 보냈습니다.\n')
            s.close()
            conn.close()
            break
        
        except Exception as c :
            print (c)
            continue
    
    continue
