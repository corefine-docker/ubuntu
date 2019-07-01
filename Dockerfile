FROM ubuntu:16.04
MAINTAINER Fe
WORKDIR /data
RUN apt-get update
RUN apt-get install -y openssh-server sudo wget lrzsz telnet
RUN echo "root:root" | chpasswd 
RUN mkdir /var/run/sshd
RUN sed -ri 's/^PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config  
RUN sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config  
EXPOSE 22
EXPOSE 8080
CMD ["/usr/sbin/sshd", "-D"]
