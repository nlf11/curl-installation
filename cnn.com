FROM centos
# MAINTAINER Neil
# DATE 12/06/2021

RUN yum update -y
RUN yum install curl -y
RUN systemctl start curl 
RUN systemctl enable curl