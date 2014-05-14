docker-cellprofiler
===================

Centos 6.4 with CellProfiler from the official repository. See http://cellprofiler.org/linux.shtml.

```
# 0. Install Docker. See https://www.docker.io/gettingstarted

# 1. Download and build docker-cellprofiler
git clone https://github.com/hajaalin/docker-cellprofiler.git
cd docker-cellprofiler
sudo docker build -t "cellprofiler" .

# 2. Test
# Start a container from image "cellprofiler" and run command "cellprofiler -help" inside the container.
sudo docker run cellprofiler cellprofiler -help

# 3. Test
# Start a container so that it sees local directories, run "cellprofiler" with option "--help"
sudo ./cp-docker-wrap.sh /tmp /tmp /tmp --help

# 4. Allow cp-docker-wrap.sh to be run with sudo without password
# - running docker requires sudo permissions
# - add a file to /etc/sudoers.d/ to make exception
# - note that the file should be edited with 'visudo', otherwise if you make a syntax error you can block sudo.  
visudo -f /etc/sudoers.d/allow-cp-docker-wrap
# - this is the line to put in the file:
your_account_here ALL = (root) NOPASSWD: /usr/local/bin/cp-docker-wrap.sh
# - now you should be able to run
cp-docker-wrap.sh  /tmp /tmp /tmp --help 


# 5. Run a CellProfiler pipeline with CreateBatchFiles
# - map input directory to /input
# - map output directory to /output
# - this produces a .h5 file (eg. mybatch.h5)

# 6. Convert CellProfiler batch file for Condor 
# - this produces sub.txt
cp-batch-condor.sh mybatch.h5 /work/test/output

# 7. Submit jobs to Condor
# - each Condor job will start a container with CellProfiler
condor_submit sub.txt 
```
