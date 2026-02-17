#!/usr/bin/env python
# coding: utf-8

# In[1]:


#pip install undetected-chromedriver==2.1.1


# In[2]:


import os
from bs4 import BeautifulSoup
import codecs
import json
import csv 
import re
import requests
from collections import OrderedDict
import urllib3 
# import requests module
import os.path 
from os.path import exists 
import re
import requests
from bs4 import BeautifulSoup
import csv
from selenium.webdriver.common.keys import Keys
import re
import json
from io import BytesIO
from PIL import Image
#import pytesseract
import urllib.request
from os import path
from selenium import webdriver
import csv
from selenium.webdriver.common.by import By
import time
import requests
session = requests.Session()
import pandas as pd
import undetected_chromedriver as uc


# In[3]:


#driver = uc.Chrome()
# options = webdriver.ChromeOptions()
# options.headless = True
options = uc.ChromeOptions()

options.user_data_dir = "./"
options = uc.ChromeOptions()
options.headless = False
#options.add_argument( '--headless' )
#chrome = uc.Chrome( options = options )
# use specific (older) version
driver = uc.Chrome(
    options = options , version_main = 116
    )


# In[4]:


#df = pd.read_csv('/home/justdial/Documents/bms/bmsurls_newdata_match.csv',sep="|")
#df = pd.read_csv('/home/justdial/Documents/bms/bms_input_theater_Dec_22_23.csv',sep="|")
# df = pd.read_csv('/home/justdial/Documents/bms/csv/bms_input_25092025.csv',sep="|")
df = pd.read_csv('/home/justdial/Documents/bms/csv/BMS_14102025.csv',sep="^")
df.columns


# In[5]:


def pagination(soup,tid,dates_l,base_url):
    

    for date in dates_l:
        
        base_url=base_url
        modify_page_url=base_url +"/"+date
        page_date= date
    
        print("page url : ", base_url)
        print("page url : ", modify_page_url)
        print("page_date : ", page_date)
        
        page_path="/home/justdial/data/input/bms_movies/"+str(tid)+"_"+str(page_date)+".html"
        file=exists(page_path)
        print(page_path)
        if(not file):
            time.sleep(5)
            print("URL : ",modify_page_url)
            driver.get(modify_page_url)
            #time.sleep(7)
            try:
                page=driver.page_source

                with open(page_path, 'w') as f:
                        f.write(page)
                        soup=page
            except:
                soup=""

        else:
            print("URL : ",modify_page_url)
            with open(page_path, 'r') as f:
                soup = BeautifulSoup(f.read(), 'html.parser')
        
        


# In[6]:


import time
import pandas as pd
from datetime import date

today = date.today()

d1 = today.strftime("%Y%m%d")
print("d1 =", d1)


# In[7]:


end=len(df)
for i in range(0,end):
    j = 0
    print("====",i)
    #print(df.iloc[i])
    row=df.iloc[i]
    url=row["URL"]
    tid=row["VenueCode"].replace('M01_', '')
#     modify_url=url+"/"+d1
    modify_url=str(url) + "/" + str(d1)
    print("url : ",url) 
    print("modify url : ",modify_url)
    
    page_path="/home/justdial/data/input/bms_movies/"+str(tid)+".html"

    file=exists(page_path)
    if(not file):
        print(d1)
        url = modify_url
        print("URL... : ",url)
        driver.get(url)
        #time.sleep(7)
        try:
            time.sleep(7)
            page=driver.page_source
        
            with open(page_path, 'w') as f:
                    f.write(page)
                    soup=page
        except:
            print('error in file')
            soup=""
                
    else:
        print("URL : ",url)
        with open(page_path, 'r') as f:
            soup = BeautifulSoup(f.read(), 'html.parser')
            
    soup=str(soup)
#     print(soup)
    try:
        a=re.findall('INITIAL_STATE__ =(.*?)</script>',soup)[0]
    #     print(a)
        #a=re.findall('({"BookMyShow":{"aiSD"(?:.|\n)*?);',soup)
        final_dictionary = json.loads(a)
        group = final_dictionary['venueShowtimesNew']['showDates']
    #     print(group)
    #         group=final_dictionary["BookMyShow"]['aiSD']
        dates=[]
        print('len of grs', len(group))
        for dd in group:
            print(j)
            j+=1
            date=dd["DateCode"]
            if (not dd["isDisabled"]):
                dates.append(date)
        print(dates)
    except:
        print('kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk')
        continue

    pagination(soup,tid,dates,url)                                                                                                                                                                             


# In[ ]:


# https://in.bookmyshow.com/cinemas/DURGA/arti-cinemas-above-reliance-trends-benachity/buytickets/ABDD/20250417
# https://in.bookmyshow.com/cinemas/DURGA/Arti-Cinemas-Above-Reliance-Trends-Benachity/buytickets/ABDD/


# In[ ]:


pagination(soup,tid,dates,url)


# In[ ]:





# In[ ]:





# In[ ]:





# In[ ]:




