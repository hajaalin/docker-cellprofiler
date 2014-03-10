FROM centos:6.4

MAINTAINER Harri Jäälinoja harri.jaalinoja@helsinki.fi

ADD cellprofiler.repo /etc/yum.repos.d/cellprofiler.repo

RUN yum -y install cellprofiler
