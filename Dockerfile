# HEADER
FROM        centos:centos6
MAINTAINER  abaranov@linux.com

# Trigger rebuild
ENV         UPDATED_AT 2015-03-13

# EPEL Repository
RUN         rpm -Uvh http://download.fedoraproject.org/pub/epel/6/i386/epel-release-6-8.noarch.rpm
RUN         sed -i 's/https/http/' /etc/yum.repos.d/epel.repo

# Update
RUN         yum -y -q makecache && \
            yum -y -q update

# Install packages
RUN         yum -y -q install \
              ansible \
              supervisord \
              git && \
            yum -y -q clean all

# Inventory file for ansible
ADD         hosts /etc/ansible/hosts
