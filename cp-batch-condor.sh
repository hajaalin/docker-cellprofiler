#!/bin/sh
#
# cp-batch-condor.sh
#
# Reads batch commands from h5 file and produces a Condor job file.
# Usage: cp-batch-condor.sh <h5-file from CellProfiler> <output directory>
# Example: cp-batch-condor.sh /home/work/20140416/input/Batch_data.h5 /home/work/20140416/output
#
INPUT=$1
OUTPUT=$2
DIR=`dirname $INPUT`
FILE=`basename $INPUT`

echo "Universe   = vanilla" > tmp.txt
sudo cp-docker-wrap.sh $DIR /tmp /tmp --get-batch-commands=/input/$FILE >> tmp.txt
cat tmp.txt | sed -e 's# -b##' -e "s#CellProfiler\(.*\)#Executable = /usr/local/bin/sudo-cp-docker-wrap.sh\nArguments  = $DIR $OUTPUT $DIR \1\nLog        = ${OUTPUT}/log/cp.\$(Process).log\nOutput     = ${OUTPUT}/log/cp.\$(Process).out\nError      = ${OUTPUT}/log/cp.\$(Process).error\nQueue\n#" > sub.txt

