# docker-ssh-jumphost

Simple docker container which can be used to log in.

To build the docker container, run "make" in this directory.

This will create a file authorized_keys (if it does not yet exist) from your public ssh keys under $HOME/.ssh.

The docker image will be named ssh-jumphost

To run this image on your host, do a

```
docker run -p SSH_PORT:22 ssh-jumphost
```

You can optinaly mount a volume on "/mnt" to expose it in the container.

To login into the container, use

```
$ ssh -l user -p SSH_PORT HOSTNAME
```

and login with your ssh keypair.
