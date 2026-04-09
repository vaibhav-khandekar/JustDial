#!/bin/bash
# folder sender

# folder path
FOLDER="/home/justdial/Downloads/R01_master_files_16032026"

# remote user
USER="justdial"

# password
PASS="justdial"

# slave machines
SLAVES=("10.0.0.1"  "10.0.0.5" "10.0.0.7" "10.0.0.8" "10.0.0.9" "10.0.0.10" "10.0.0.11" "10.0.0.12" "10.0.0.14" "10.0.0.15" "10.0.0.18" "10.0.0.19" "10.0.0.21" "10.0.0.27" "10.0.0.29" "10.0.0.31" "10.0.0.34" "10.0.0.40" "10.0.0.42" "10.0.0.47")

# Loop through servers
for SLAVE in "${SLAVES[@]}"
do
    sshpass -p $PASS scp -r $FOLDER $USER@$SLAVE:~/
    echo "$FOLDER share with $SLAVE"
done

echo ""
echo "$FOLDER shared with all slave machines"




