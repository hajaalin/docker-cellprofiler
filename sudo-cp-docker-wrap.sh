#!/bin/bash

#
# sudo-cp-docker-wrap.sh
# 
# Runs cp-docker-wrap.sh with sudo
# You can use this as "Executable" in a Condor job submission, e.g.
# 
# Universe   = vanilla
# Executable = /usr/local/bin/sudo-cp-docker-wrap.sh
# Arguments  = /home/work/20140416/input /home/work/20140416/output /home/work/20140416/pipeline  -c -r -p /input/Batch_data.h5 -g Metadata_XY=1397640016
# Log        = /home/work/20140416/output/log/cp.$(Process).log
# Output     = /home/work/20140416/output/log/cp.$(Process).out
# Error      = /home/work/20140416/output/log/cp.$(Process).error
# Queue
# 

/usr/bin/sudo /usr/local/bin/cp-docker-wrap.sh $@
