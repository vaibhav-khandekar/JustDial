#!/bin/bash
# file sender

# Common variables
USER="justdial"
PASS="justdial"
FILE="/home/justdial/Downloads/all_images_160326/images_all_2L.py"
DESTINATION="~/all_images_160326/"

# List of servers
SLAVES=("10.0.0.1" "10.0.0.15" "10.0.0.19" "10.0.0.21" "10.0.0.27" "10.0.0.29" "10.0.0.31" "10.0.0.34" "10.0.0.40" "10.0.0.42")

# Loop through each server
for SLAVE in "${SLAVES[@]}"
do
    echo "Sending file to $SLAVE..."
    sshpass -p "$PASS" scp "$FILE" "$USER@$SLAVE:$DESTINATION"
done

echo "All files sent successfully :)"
