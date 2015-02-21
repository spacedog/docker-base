FROM        centos:centos6
MAINTAINER  abaranov@linux.com
RUN         rpm -Uvh http://download.fedoraproject.org/pub/epel/6/i386/epel-release-6-8.noarch.rpm
RUN         sed -i 's/https/http/' /etc/yum.repos.d/epel.repo
RUN         yum makecache
RUN         yum -y install ansible git
ADD         hosts /etc/ansible/hosts
