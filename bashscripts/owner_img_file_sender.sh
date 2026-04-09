#!/bin/bash
# file sender

# Common variables
USER="justdial"
PASS="justdial"
FILE="/home/justdial/Downloads/owner_ip_090226/weekly_owners.py"
DESTINATION="~/owner_ip_090226/"

# List of servers
SLAVES=(
"10.0.0.205"
"10.0.0.200"
"10.0.0.201"
"10.0.0.202"
"10.0.0.123"
"10.0.0.120"
"10.0.0.150"
"10.0.0.212"
"10.0.0.113"
"10.0.0.114"
"10.0.0.115"
"10.0.0.116"
"10.0.0.117"
"10.0.0.185"
"10.0.0.186"
"10.0.0.187"
"10.0.0.188"
"10.0.0.193"
"10.0.0.194"
"10.0.0.198"
)

# Loop through each server
for SLAVE in "${SLAVES[@]}"
do
    echo "Sending file to $SLAVE..."
    sshpass -p "$PASS" scp "$FILE" "$USER@$SLAVE:$DESTINATION"
done

echo "All files sent successfully :)"
