# "ported" by Adam Miller <maxamillion@fedoraproject.org> from
#   https://github.com/fedora-cloud/Fedora-Dockerfiles
#
# Originally written for Fedora-Dockerfiles by
#   scollier <scollier@redhat.com>

FROM centos:centos7
MAINTAINER The CentOS Project <cloud-ops@centos.org>

RUN yum -y update; yum clean all;

# sudo 권한 및 ssh설치
RUN yum -y install sudo; yum clean all;
RUN yum -y install openssh-server passwd; yum clean all;

# dnf 설치
RUN yum -y install dnf; yum clean all;

# code-server 설치
RUN yum -y install wget; yum clean all;

# Tfenv 설치
RUN yum -y install git; yum clean all;
RUN yum -y install unzip; yum clean all;

# script추가
ADD ./user.sh /user.sh
ADD ./install.sh /install.sh

RUN mkdir /var/run/sshd
RUN ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key -N ''

RUN chmod 755 /*.sh
# RUN chmod 755 /user.sh
# EXPOSE 23

# script 실행 (root 권한)
RUN ./user.sh
RUN ./install.sh

# script 실행 (terra 권한)
# USER terra


ENTRYPOINT ["/usr/sbin/sshd", "-D"]
