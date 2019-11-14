#!/bin/bash

if [[ "$#" -ne 4 ]]; then
    echo "Usage : [YEAR] [MONTH] [DAY] [HOUR]"
    exit
fi

YEAR=$1
MONTH=$2
DAY=$3
HOUR=$4

echo "Executing script for $1-$2-$3 - $4h..."

papermill velib_stations_usage.ipynb /tmp/output.ipynb -p year $YEAR -p month $MONTH -p day $DAY -p hour $HOUR
aws s3 cp --endpoint-url $AWS_S3_ENDPOINT /tmp/output.ipynb s3://velib-usage/$YEAR-$MONTH-$DAY-$HOUR.ipynb
