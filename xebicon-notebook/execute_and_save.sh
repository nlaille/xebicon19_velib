#!/bin/bash

if [[ "$#" -ne 3 ]]; then
    echo "Usage : [YEAR] [MONTH] [DAY]"
    exit
fi

YEAR=$1
MONTH=$2
DAY=$3

echo "Executing script for $1-$2-$3..."

papermill velib_stations_usage.ipynb /tmp/output.ipynb -p year=$YEAR -p month=$MONTH -p day=$DAY
aws s3 cp /tmp/output.ipynb s3://velib-usage/$1-$2-$3.ipynb

