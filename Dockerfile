FROM docker.io/centos


   RUN yum install -y python-setuptools net-tools lrzsz tcpdump \
   && easy_install supervisor \
   &&   yum install -y openssh openssh-server openssh-clients \
   &&  /bin/echo 'root:xinwei' |chpasswd  \
   &&  mkdir /var/run/sshd \
   &&  ssh-keygen -t dsa -f /etc/ssh/ssh_host_dsa_key \
   &&  ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key \
   &&  /bin/sed -i 's/.*session.*required.*pam_loginuid.so.*/session optional pam_loginuid.so/g' /etc/pam.d/sshd \
   && yum clean all
   
