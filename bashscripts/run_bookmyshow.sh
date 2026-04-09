#!/bin/bash

export DISPLAY=:0
export XAUTHORITY=/home/justdial/.Xauthority

source /home/justdial/anaconda3/etc/profile.d/conda.sh
conda activate base

cd /home/justdial/Documents/bms || exit 1

/home/justdial/anaconda3/bin/python bookmyshow.py >> /home/justdial/development/bookmyshow.log 2>&1

