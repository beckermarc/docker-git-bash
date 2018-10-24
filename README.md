## git-bash

A docker image with bash and git installed.

[![DockerHub Badge](http://dockeri.co/image/beckermarc/git-bash)](https://hub.docker.com/r/beckermarc/git-bash)

#### Usage
```
docker run -v /your/git/repo:/git -v /your/git-init.sh:/git-init.sh -it beckermarc/git-bash:latest
```

#### Configuration
During startup the `/git-init.sh` file is sourced, if existing. 
It can be used to initialize global git configuration. An example git-init.sh might look like this:

```
git config --global user.name "Jane Doe"
git config --global user.email "jane.doe@example.org"
```
