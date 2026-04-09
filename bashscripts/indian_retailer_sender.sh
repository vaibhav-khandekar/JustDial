#!/bin/bash

today=$(date +"%d%m%y")
echo $today

echo ""
echo "sending indianretailer"${today}".csv to the server"

sshpass -p 'fou$dmo56Yener@4' scp /home/justdial/development/indianretailer${today}.csv bsp@172.29.64.221:~/development

echo "today's indianretailer file added to the server"


