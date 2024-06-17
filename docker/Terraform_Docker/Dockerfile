# "ported" by Adam Miller <maxamillion@fedoraproject.org> from
#   https://github.com/fedora-cloud/Fedora-Dockerfiles
#
# Originally written for Fedora-Dockerfiles by
#   scollier <scollier@redhat.com>

FROM centos:centos7
MAINTAINER The CentOS Project <cloud-ops@centos.org>

RUN yum -y update; yum clean all

# sudo 권한 및 ssh설치
RUN yum -y install sudo; yum clean all; \
yum -y install openssh-server passwd; yum clean all

# dnf 설치
RUN yum install -y dnf;

# code-server 설치
RUN yum -y install wget;

# Terraform 설치
RUN yum install -y yum-utils; yum clean all; \
yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo; \
yum -y install terraform; yum clean all


ADD ./start.sh /start.sh
RUN mkdir /var/run/sshd

RUN ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key -N ''

RUN chmod 755 /start.sh
# EXPOSE 23
RUN ./start.sh
ENTRYPOINT ["/usr/sbin/sshd", "-D"]
