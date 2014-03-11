docker-cellprofiler
===================

Centos 6.4 with CellProfiler

* Install Docker

* Download and build docker-cellprofiler
```
git clone https://github.com/hajaalin/docker-cellprofiler.git
cd docker-cellprofiler
sudo docker build -t "cellprofiler" .
```

* Test

```
sudo docker run cellprofiler cellprofiler -help
```

* Start container with local input, output and pipeline directories mapped as volumes, start a pipeline.
```
sudo ./cp-docker-wrap input_dir output_dir pipeline_dir pipeline.cp
```
