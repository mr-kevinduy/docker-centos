FROM centos:7

MAINTAINER KevinDuy <mr.kevinduy@gmail.com>

ENV container docker

# remove some files to enable systemd
RUN (cd /lib/systemd/system/sysinit.target.wants/; for i in *; do [ $i == \
systemd-tmpfiles-setup.service ] || rm -f $i; done); \
rm -f /lib/systemd/system/multi-user.target.wants/*;\
rm -f /etc/systemd/system/*.wants/*;\
rm -f /lib/systemd/system/local-fs.target.wants/*; \
rm -f /lib/systemd/system/sockets.target.wants/*udev*; \
rm -f /lib/systemd/system/sockets.target.wants/*initctl*; \
rm -f /lib/systemd/system/basic.target.wants/*;\
rm -f /lib/systemd/system/anaconda.target.wants/*;

# RUN yum clean all && yum -y install openssh-server openssh-clients initscripts

# RUN ssh-keygen -f /etc/ssh/ssh_host_rsa_key -N '' -t rsa
# RUN ssh-keygen -f /etc/ssh/ssh_host_ed25519_key -N '' -t ed25519
# EXPOSE 22

# # setup new root password
# RUN echo root:pass | chpasswd

ADD install.sh /install.sh

RUN sed -i $'s/\r$//' /*.sh
RUN chmod +x /*.sh

RUN /install.sh

VOLUME [ "/sys/fs/cgroup" ]

CMD ["/usr/sbin/init"]
