#!/bin/sh
input=$1
output=$2
pipelines=$3
pipeline=$4

container_i=/input
container_o=/output
container_p=/pipelines

cmd="docker run -rm -t -i "

# map volumes to local directories given as arguments
cmd="$cmd -v $input:$container_i" 
cmd="$cmd -v $output:$container_o"
cmd="$cmd -v $pipelines:$container_p"  

# container name and command to run
cmd="$cmd cellprofiler cellprofiler"

# options to command
cmd="$cmd -i $container_i"
cmd="$cmd -o $container_o"
cmd="$cmd -p $container_p/$pipeline"

echo $cmd
$cmd

