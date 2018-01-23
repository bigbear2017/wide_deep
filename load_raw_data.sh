#!/bin/bash
set -e
input_hdfs_dir=/user/algo/algo_fea/v1/feature_joiner
output_local_dir=/home/appops/data/train

if [ $# -eq 0 ];then
    dt=`date -d "yesterday" +%Y%m%d`
elif [ $# -eq 1 ];then
    dt=$1
fi

if [ ! -d $output_local_dir/$dt ]; then
		sudo -iu appops mkdir -p $output_local_dir/$dt && echo "Make local path $output_local_dir/$dt"
fi

sudo -iu appops hadoop fs -get $input_hdfs_dir/$dt/part* $output_local_dir/$dt
sudo -iu appops chmod 666 $output_local_dir/$dt/*
echo "$?"
