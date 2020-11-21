# docker-ssh-jumphost

Simple docker container which can be used to log in.

To build the docker container, run "make" in this directory.

The docker image will be named ssh-jumphost

To run this image on your host, you have to provide the base64 encoded
version of an authorized_keys file via the SSH_AUTHORIZED_KEYS
environment variable.

You also have to specify the port where the SSH daemon should be reachable.

For example, do a:

```
docker run -p SSH_PORT:22 --env SSH_AUTHORIZED_KEYS=$(base64 authorized_keys) ssh-jumphost
```

You can optinaly mount a volume on "/mnt" to expose it in the container.

To login into the container, use

```
$ ssh -l user -p SSH_PORT HOSTNAME
```

and login with a ssh key which was specified in the SSH_AUTHORIZED_KEYS file.
