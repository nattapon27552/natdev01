FROM rockylinux/rockylinux:latest

MAINTAINER NatDev
LABEL Remarks="RockyLinux test image for installing static webpage with Apache2"

# Install apache2 with less
RUN yum -y update && \
yum -y install httpd && \
rm -rf /var/lib/apt/lists/* && \
rm -rf /var/lib/yum/lists/* && \
yum clean all

# Sample index.html for test
COPY index.html /var/www/html/index.html

# Port and set entry point for container
EXPOSE 80
ENTRYPOINT /usr/sbin/httpd -DFOREGROUND
CMD ["echo", "Hello World...! from my docker image"]
