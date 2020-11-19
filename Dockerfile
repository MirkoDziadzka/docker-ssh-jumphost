FROM ubuntu:latest
MAINTAINER Mirko Dziadzka <mirko.dziadzka@gmail.com>

RUN apt-get update
RUN apt-get install -y supervisor
RUN apt-get install -y openssh-server
RUN apt-get install -y sudo
RUN apt-get install -y screen

RUN mkdir -p /run/sshd

RUN useradd --base-dir /local --create-home --shell /bin/bash user
COPY authorized_keys /local/user/.ssh/authorized_keys
COPY supervisord.conf supervisord.conf
COPY sudoers /etc/sudoers

VOLUME /mnt
EXPOSE 22

CMD ["/usr/bin/supervisord", "-c", "/supervisord.conf"]


