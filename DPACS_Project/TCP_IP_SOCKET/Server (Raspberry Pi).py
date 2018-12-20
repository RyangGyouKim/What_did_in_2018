# -*- coding: utf-8 -*-
"""
Created on Sun Nov 25 18:14:43 2018

@author: 302
"""
import socket
import os
import base64
import time

class tcp_information:
    TCP_IP = '25.29.244.83'
    TCP_PORT = 2620
    BUFFER_SIZE = 700000
    filepath = '/home/pi/example_pictures/sent_picture'
    check_sending= False
    Buzzer=''
    def __init__(self, TCP_IP='25.29.244.83',TCP_PORT = 2620,BUFFER_SIZE = 700000,filepath = '/home/pi/example_pictures/sent_picture'):
        self.TCP_IP=TCP_IP
        self.TCP_PORT=TCP_PORT
        self.BUFFER_SIZE=BUFFER_SIZE
        self.filepath=filepath
    def get_buzzer(self):
        return self.Buzzer
    def Sever_connect(self,carNum):
        try:
            #while----1
            while True:
                 if self.check_sending == True :
                     self.check_sending = False
                     break
                 
                 s = socket.socket(socket.AF_INET, socket.SOCK_STREAM) 
                 s.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)   # 포트 닫고나서 즉시 사용 할수 있게 해줌
                 s.bind((self.TCP_IP, self.TCP_PORT))
                 s.listen(1)
                 
                 conn, addr = s.accept()
                 
                 if s.bind :
                     print ('\nConnection address:', addr)
                     #while---2
                     while True : #파일이 생기지 않아있으면 계속 루프 돌기.
                         file_list = os.listdir(self.filepath) #파일들을 배열에 저장
                         file_len = len(file_list)
                         print('Number of repeats : ', file_len)
                         
                         if file_len != 0 :
                             try :
                                 for i in range(0,file_len) :
                                     print ('\ntrans_list : ' ,file_list)
                                     file = ('%s/%s' %(self.filepath, file_list[i]))
                                     
                                     # 소켓 data 보내기 : carNum
                                     while True :
                                         try :         
                                             conn.send(carNum.encode('utf-8'))
                                             print('Try sending...', carNum)  
                                             break
                                         except Exception as w:
                                             print(w)
                                             break
                                     # 소켓 data 보내기 : data길이, data
                                     with open(file, 'rb') as f:
                                         data = base64.b64encode(f.read(200000))
                                        
                                         data_len = "%d" %(len(data))
                                         conn.send(data_len.encode('utf-8'))
                                         time.sleep(3) 
                                         print('Transport file length : ', len(data))
                                         conn.sendall(data)
                            
                                    
                                     print('trans complete[%s]' %(file_list[i]))
                                    
                                    #전송된 file은 삭제
                                     os.remove(file)
                            
                                     while True:
                                         try : #Buzzer정보를 Client로부터 받는다.
                                             self.Buzzer = conn.recv(self.BUFFER_SIZE)
                                             self.Buzzer = self.Buzzer.decode()
                                             if not self.Buzzer : continue
                                             else :
                                                 print("Disalbe : ", self.Buzzer)
                                                 self.check_sending=True #라즈베리 파이에 있는 파일을 클라이언트에 보내고 부져 받을 받았을때 통신이 완벽히 해소 된 것으로 간주 true
                                                 break
                                         except :
                                             print ('Buzzer data error..')
                                             continue
                                 break #while----2 break
                             except :
                                 print ('File data transport error.\n')
                                 continue     
                         else : 
                             print('No file. Wait ...')
                             time.sleep(3)
                             continue
                     
                 else : 
                     print('no bind client. wait..')
                     continue
        except KeyboardInterrupt: 
            print('++++++File server The End++++++')
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            