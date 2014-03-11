#!/bin/sh

# absolute paths of local input, output and pipeline directories
local_i=$1
local_o=$2
local_p=$3

# name of the pipeline to run
pipeline=$4

# names of input, output and pipeline directories inside the container
container_i=/input
container_o=/output
container_p=/pipelines

# build the command to run
cmd="docker run -rm -t -i "

# map volumes to local directories 
cmd="$cmd -v $local_i:$container_i" 
cmd="$cmd -v $local_o:$container_o"
cmd="$cmd -v $local_p:$container_p"  

# image name (cellprofiler) and command to run (cellprofiler)
cmd="$cmd cellprofiler cellprofiler"

# options to cellprofiler
cmd="$cmd -i $container_i"
cmd="$cmd -o $container_o"
cmd="$cmd -p $container_p/$pipeline"

echo $cmd
$cmd

