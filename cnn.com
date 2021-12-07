FROM centos
# MAINTAINER Neil
# DATE 12/06/2021
# Descripiton: Curl installation

RUN yum update -y
RUN yum install curl -y
RUN systemctl start curl 
RUN systemctl enable curl
RUN systemctl start firewalld
RUN firewall-cmd --permanent --add-port=85/tcp
RUN firewall-cmd --reload
RUN firewall-cmd --permanent --add-service=http
RUN firewall-cmd --reload
RUN firewall-cmd --list all