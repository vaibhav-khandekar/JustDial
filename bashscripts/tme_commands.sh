#!/bin/bash

# change to the specified directory
echo "changing to directory: tme_output"
cd tme_output

echo ""

# combine all CSV files into alc.csv
echo "combining all csv files into alc.csv"
cat *.csv > alc.csv

echo ""

# sort the file by the 49th column and remove duplicates based on the 49th column
echo "sorting alc.csv by the 49th column and removing duplicates"
sort -t'|' -k49,49 -u alc.csv | awk -F'|' 'NR==1 || $49 != prev {print; prev=$49}' > tme_weekly_op_190326.csv

echo ""

# remove any lines containing 'doc_id'
echo "removing lines containing 'doc_id' from tme_weekly_op_190326.csv"
sed -i '/doc_id/d' "tme_weekly_op_190326.csv"

echo ""

# add header to the csv file
echo "adding header to tme_weekly_op_120326.csv"
find /home/justdial/Documents/tme/tme_output/ -type f -name "tme_weekly_op_190326.csv" -exec sed -i '1s/^/doc_id|check_string|Search_string|pincode|name|address|address_code|lat|lng|phone|stdcode|phone1|phone2|phone_ext|mobile1|mobile2|tollfree1|tollfree2|hours|JD_hours|reviews|rating|category|secondary_categories|website|email|social_media|photos_available|video_available|Payments|about|from_the_owner|highest_popular_time|popular_time|menu|find_table|women_owned|lgbtq_friendly|Store_Flag|directory|hotel_details|amenities|checkin_time|checkout_time|Highlights|RAC_time|RAC_type|claim_business_tag|uniq_id|service_id|rev_id_1|rev_id_2|book_now_id|price_range|RR_rehit_tag|url|Reserved_table|Menu_highlight_img|place_order|owned_by_tag\n/' {} \;

echo ""

# remove all double quotes from the file file
echo "removing double quotes from tme_weekly_op_190326.csv"
sed -i 's/"//g' tme_weekly_op_190326.csv

echo ""

# count the number of lines in the csv file
echo "counting the number of lines in tme_weekly_op_190326.csv"
wc -l tme_weekly_op_190326.csv

echo ""

# Securely copy the file to the remote server
echo "Copying tme_weekly_op_190326.csv to shefali's machine"
sshpass -p justdial scp tme_weekly_op_190326.csv justdial@172.29.132.192:~/Desktop/vaibhav

#echo "not shared"

echo "done"
