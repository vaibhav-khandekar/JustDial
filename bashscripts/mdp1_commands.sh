#!/bin/bash

# Chaning directory
echo "changing directory to mdp1_op_february_26"
cd mdp1_op_february_26

echo ""

# Combine all CSV files into one file
echo "combining all CSV files into alc.csv..."
cat *.csv > alc.csv

echo ""

# Sort the file based on column 49 and remove duplicates
echo "sorting alc.csv based on column 49 and removing duplicates..."
sort -t'|' -k49,49 -u alc.csv | awk -F'|' 'NR==1 || $49 != prev {print; prev=$49}' > mdp1_op_february26.csv

echo ""

# Remove lines containing 'doc_id' from the file
echo "removing lines containing 'doc_id' from mdp1_op_february26.csv..."
sed -i '/doc_id/d' "mdp1_op_february26.csv"

echo ""

# Add a header row with the specified column names
echo "adding header to mdp1_op_february26.csv..."
find /home/justdial/Documents/MDP/1/mdp1_output/ -type f -name "mdp1_op_march26.csv" -exec sed -i '1s/^/doc_id|check_string|Search_string|pincode|name|address|address_code|lat|lng|phone|stdcode|phone1|phone2|phone_ext|mobile1|mobile2|tollfree1|tollfree2|hours|JD_hours|reviews|rating|category|secondary_categories|website|email|social_media|photos_available|video_available|Payments|about|from_the_owner|highest_popular_time|popular_time|menu|find_table|women_owned|lgbtq_friendly|Store_Flag|directory|hotel_details|amenities|checkin_time|checkout_time|Highlights|RAC_time|RAC_type|claim_business_tag|uniq_id|service_id|rev_id_1|rev_id_2|book_now_id|price_range|RR_rehit_tag|url|Reserved_table|Menu_highlight_img|place_order|owned_by_tag\n/' {} \;

echo ""

# Remove double quotes from the file
echo "removing double quotes from mdp1_op_february26.csv ..."
sed -i 's/"//g' mdp1_op_february26.csv

echo ""

# Count the number of lines in the file
echo "counting the number of lines in mdp1_op_february26.csv ..."
wc -l mdp1_op_february26.csv

echo ""

# Transfer the file to the remote server
echo "transferring mdp1_op_february26.csv to shefali's machine..."
sshpass -p justdial scp mdp1_op_february26.csv justdial@172.29.132.192:~/Desktop/vaibhav

echo ""

echo "done"

