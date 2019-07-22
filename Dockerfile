FROM ubuntu:18.04
MAINTAINER Fe
WORKDIR /data
COPY sources.list /etc/apt/sources.list
RUN apt-get -y update --fix-missing
RUN apt-get install -y openssh-server sudo wget lrzsz telnet software-properties-common python-software-properties tzdata vim zip unzip net-tools
RUN echo "root:root" | chpasswd
RUN mkdir /var/run/sshd
RUN sed -ri 's/^PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config
RUN \cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
RUN mkdir /root/.ssh
RUN apt-get clean && rm -rf /tmp/* /var/tmp/*
EXPOSE 22
EXPOSE 8080
CMD ["/usr/sbin/sshd", "-D"]
