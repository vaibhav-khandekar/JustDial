#!/bin/bash
# folder sender

# folder path
FOLDER="/home/justdial/Downloads/owner_ip_160326"

# remote user
USER="justdial"

# password
PASS="justdial"

# slave machines
SLAVES=("10.0.0.205" "10.0.0.200" "10.0.0.201" "10.0.0.202" "10.0.0.123" "10.0.0.120" "10.0.0.150" "10.0.0.212" "10.0.0.113" "10.0.0.114" "10.0.0.115" "10.0.0.116" "10.0.0.117" "10.0.0.185" "10.0.0.186" "10.0.0.187" "10.0.0.188" "10.0.0.193" "10.0.0.194" "10.0.0.198")

# Loop through servers
for SLAVE in "${SLAVES[@]}"
do
    sshpass -p $PASS scp -r $FOLDER $USER@$SLAVE:~/
    echo "$FOLDER share with $SLAVE"
done

echo "$FOLDER shared with all slave machines"

