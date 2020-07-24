#!/bin/bash
#INPUT_FILE=pipeline_20200625.log
#OUTPUT_FILE=output_stats_20200625.txt
INPUT_FILE=$1
OUTPUT_FILE=$2

OUTPUT_PREFIX=job_info_
# rm ${OUTPUT_PREFIX}*

# get commands and job ids 
grep -A 2 "running statement" $INPUT_FILE > pipeline_commands.txt

# split into one file per job
split -l 4 pipeline_commands.txt $OUTPUT_PREFIX

# get job id
split_files=`ls ${OUTPUT_PREFIX}*`
for fname in $split_files
do
    JOB_ID=`awk 'FNR == 3 {print $NF}' $fname`
    echo $JOB_ID
    qacct -j $JOB_ID >> $fname
    
    echo $JOB_ID 
    
    # get specific lines of interest
    sed -n '12,13p;47,53p' $fname | awk '{print $2}' |xargs -n9 | tr ' ' '\t' >> temp.txt

done

# add header 
sed -n '12,13p;47,53p' ${OUTPUT_PREFIX}aa | awk '{print $1}' |xargs -n9 | tr ' ' '\t' > header.txt
cat header.txt temp.txt > $OUTPUT_FILE
# compile data


rm pipeline_commands.txt header.txt temp.txt