# docker-ssh-jumphost

Simple docker container which can be used to log in.

To build the docker container, run "make" in this directory.

This will create a file authorized_keys (if it does not yet exist) from your public ssh keys under $HOME/.ssh.

The docker image will be named ssh-jumphost
