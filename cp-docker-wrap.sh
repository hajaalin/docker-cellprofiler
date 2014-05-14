#!/bin/sh

#
# cp-docker-wrap.sh
# Usage: cp-docker-wrap.sh <inputdir> <outputdir> <pipelinedir> <cellprofiler options>
# - starts a Docker container with CellProfiler installed
# - maps provided directories as volumes in the container
# - runs "cellprofiler" command inside the container, followed by provided options
#
# In your CellProfiler CreateBatchFiles module you should map
# - directory with images to "/input"
# - output directory to "/output"
#

# absolute paths of local input, output and pipeline directories
local_i=$1; shift
local_o=$1; shift
local_p=$1; shift

# cellprofiler command to run
cp_cmd=$@

# names of input, output and pipeline directories inside the container
container_i=/input
container_o=/output
container_p=/pipelines

# build the command to run
cmd="docker run --rm -t -i "
#cmd="docker run --rm"

# map volumes to local directories 
cmd="$cmd -v $local_i:$container_i" 
cmd="$cmd -v $local_o:$container_o"
cmd="$cmd -v $local_p:$container_p"  

# image name (cellprofiler) and command to run (cellprofiler)
cmd="$cmd cellprofiler cellprofiler"

# options to cellprofiler
cmd="$cmd -i $container_i"
cmd="$cmd -o $container_o"
cmd="$cmd $cp_cmd"
#echo $cmd
$cmd

