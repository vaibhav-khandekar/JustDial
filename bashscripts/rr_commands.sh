#!/bin/bash

# Script to process CSV files as per the specified commands

# changing directory
echo "changing directory to R01_master_op_26022026"
cd R01_master_op_26022026

echo ""

# Step 1: Count the number of lines in files starting with 'P' and ending with '.csv'
echo "Counting lines in all csv files..."
wc -l P*.csv

echo ""

# Step 2: Concatenate all CSV files into a single file 'alc.csv'
echo "Concatenating all CSV files into alc.csv..."
cat *.csv > alc.csv

echo ""

# Step 3: Sort and remove duplicate lines, output to R01.csv
echo "Sorting and removing duplicate lines to create R01.csv..."
sort -uf alc.csv > R01.csv

echo ""

# Step 4: Remove specific header lines from R01.csv using sed
echo "Removing specific header lines from R01.csv..."
sed -i '/Input_docid|Restaurants_Name|full_address|street|area|landmark|city|state|pincode|Phone|Stdcode|Phone0|Phone1|Phone2|Phone3|Phone4|Mobile0|Mobile1|Mobile2|Mobile3|Mobile4|Timing|JD_Hours_of_Operation|Nearby_Metro|Happy_Hours|JD_Happy_Hours_of_Operation|Price|Discount|Card_Offer_Bank_Name|Card_Offer|Payment|Tags|Table_Reservation|Highlights|Establishment_Type|Cuisine|Buffet|Brunch|Rating|Reviews|Votes|Event_tag|Event|Five_Star|Latitude|Longitude|First_Review|Review_Date|Review_Time|Known_For|Restaurants_id|order_status|image_id|menu_flag|All_tag|Supreme|Terms_and_Conditions|Delisted_Tags|Temporary_Closed|food_people_love_here|food_rating|food_level_style|service_people_love_here|service_rating|service_level_style|look_and_feel_people_love_here|look_and_feel_rating|look_and_feel_level_style|Offers|Home_Delivery_Only|Opening_Soon|Permanently_Closed|Recommended_dishes|new_tag|URL|Banner_URL|Image_url|Image_path|Outlet_id|Collection_Name|Book_Table_URL|Gold_Offer|Gold_Desc|sneek_peek_link|sneek_peek_video|Chains_id|Frequent_Searches|fssai_no|Delivered_To|Delivered_In|About_this_place|Food_menu_Img|Bar_menu_Img|Beverage_menu_Img|Menu_Img|Deli_menu_Img|Dining_offers|Delivered_Rating|Delivered_Reviews|Status|Input_Url|Input_rest_id/d' "R01.csv"

echo ""

# Step 5: Add header to CSV files in the specified directory
echo "Adding header to R01.csv file..."

find /home/justdial/Documents/RR/R01_master_op_26022026 -type f -name "R01.csv" -exec sed -i '1s/^/Input_docid|Restaurants_Name|full_address|street|area|landmark|city|state|pincode|Phone|Stdcode|Phone0|Phone1|Phone2|Phone3|Phone4|Mobile0|Mobile1|Mobile2|Mobile3|Mobile4|Timing|JD_Hours_of_Operation|Nearby_Metro|Happy_Hours|JD_Happy_Hours_of_Operation|Price|Discount|Card_Offer_Bank_Name|Card_Offer|Payment|Tags|Table_Reservation|Highlights|Establishment_Type|Cuisine|Buffet|Brunch|Rating|Reviews|Votes|Event_tag|Event|Five_Star|Latitude|Longitude|First_Review|Review_Date|Review_Time|Known_For|Restaurants_id|order_status|image_id|menu_flag|All_tag|Supreme|Terms_and_Conditions|Delisted_Tags|Temporary_Closed|food_people_love_here|food_rating|food_level_style|service_people_love_here|service_rating|service_level_style|look_and_feel_people_love_here|look_and_feel_rating|look_and_feel_level_style|Offers|Home_Delivery_Only|Opening_Soon|Permanently_Closed|Recommended_dishes|new_tag|URL|Banner_URL|Image_url|Image_path|Outlet_id|Collection_Name|Book_Table_URL|Gold_Offer|Gold_Desc|sneek_peek_link|sneek_peek_video|Chains_id|Frequent_Searches|fssai_no|Delivered_To|Delivered_In|About_this_place|Food_menu_Img|Bar_menu_Img|Beverage_menu_Img|Menu_Img|Deli_menu_Img|Dining_offers|Delivered_Rating|Delivered_Reviews|Status|Input_Url|Input_rest_id\n/' {} \;

echo ""

# step 6: Remove double quotes from the file
echo "removing double quotes from the file R01.csv"
sed -i 's/"//g' R01.csv

echo ""

# Step 7: Count the number of lines in R01.csv
echo "Counting lines in R01.csv..."
wc -l R01.csv

echo ""

echo "done"

