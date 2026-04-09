#!/bin/bash
# Step 0: Change directory to final

cd final

echo "in the final directory"
echo

# Step 1: Merge all CSV files in the current directory into one file named alc.csv

echo "merging all CSV files into alc.csv..."

cat *.csv > alc.csv

echo "merged CSV files into alc.csv."
echo ""

# Step 2: Sort alc.csv by the 49th column and remove duplicate entries based on that column
# We also ensure only the first occurrence of a unique $49 value is kept

echo "sorting alc.csv by the 49th column and removing duplicates..."

sort -t'|' -k49,49 -u alc.csv | awk -F'|' 'NR==1 || $49 != prev {print; prev=$49}' > cat_pin_op_march26.csv

echo "sorted and removed duplicates based on column 49."
echo ""

# Step 3: Remove any rows containing the text "doc_id"

echo "removing rows that contain 'doc_id'..."

sed -i '/doc_id/d' "cat_pin_op_march26.csv"

echo "removed lines containing 'doc_id'."
echo ""

# Step 4: Add header row to the remains_7cr_op_may25.csv file in the specified directory

echo "adding header row to the CSV in the final directory..."

#find /home/justdial/Documents/Cat-Pin/final/ -type f -name "cat_pin_op_march26.csv" -exec sed -i '1s/^/doc_id|check_string|Search_string|pincode|name|address|address_code|lat|lng|phone|stdcode|phone1|phone2|phone_ext|mobile1|mobile2|tollfree1|tollfree2|hours|JD_hours|reviews|rating|category|secondary_categories|website|email|social_media|photos_available|video_available|Payments|about|from_the_owner|highest_popular_time|popular_time|menu|find_table|women_owned|lgbtq_friendly|Store_Flag|directory|hotel_details|amenities|checkin_time|checkout_time|Highlights|RAC_time|RAC_type|claim_business_tag|uniq_id\n/' {} \;

find /home/justdial/Documents/Cat-Pin/final/ -type f -name "cat_pin_op_march26.csv" -exec sed -i '1s/^/doc_id|check_string|Search_string|pincode|name|address|address_code|lat|lng|phone|stdcode|phone1|phone2|phone_ext|mobile1|mobile2|tollfree1|tollfree2|hours|JD_hours|reviews|rating|category|secondary_categories|website|email|social_media|photos_available|video_available|Payments|about|from_the_owner|highest_popular_time|popular_time|menu|find_table|women_owned|lgbtq_friendly|Store_Flag|directory|hotel_details|amenities|checkin_time|checkout_time|Highlights|RAC_time|RAC_type|claim_business_tag|uniq_id|service_id|rev_id_1|rev_id_2|book_now_id|price_range|RR_rehit_tag|url|Reserved_table|Menu_highlight_img|place_order|owned_by_tag\n/' {} \;

echo "header added."
echo ""

# Step 5: Remove all double quotes from the file

echo "removing double quotes from cat_pin_op_march26.csv..."

sed -i 's/"//g' cat_pin_op_march26.csv

echo "removed all double quotes."
echo ""

# Step 6: Count the number of lines in the final file

echo "counting number of lines in cat_pin_op_march26.csv..."

wc -l cat_pin_op_march26.csv

echo ""

# Step 7: Copy the final file to the remote server

echo "transferring file to remote server..."

sshpass -p justdial scp cat_pin_op_march26.csv justdial@172.29.132.192:~/Desktop/vaibhav

echo "file transferred to 172.29.132.192:~/Desktop/vaibhav"
echo ""

echo "script completed successfully."

