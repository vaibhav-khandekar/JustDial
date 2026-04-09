#!/bin/bash
# folder sender

# folder path
FOLDER="/home/justdial/Downloads/all_images_160326"

# remote user
USER="justdial"

# password
PASS="justdial"

# slave machines
SLAVES=("10.0.0.1" "10.0.0.15" "10.0.0.19" "10.0.0.21" "10.0.0.27" "10.0.0.29" "10.0.0.31" "10.0.0.34" "10.0.0.40" "10.0.0.42")

# Loop through servers
for SLAVE in "${SLAVES[@]}"
do
    sshpass -p $PASS scp -r $FOLDER $USER@$SLAVE:~/
    echo "$FOLDER share with $SLAVE"
done

echo "$FOLDER shared with all slave machines"

