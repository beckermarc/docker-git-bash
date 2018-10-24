FROM bash:4.4

# set the default shell to bash
RUN ln -s /usr/local/bin/bash /bin/bash
RUN sed -i -e "s/bin\/ash/bin\/bash/" /etc/passwd

# install git
RUN echo "@edge http://dl-cdn.alpinelinux.org/alpine/edge/main" >> /etc/apk/repositories
RUN apk add git@edge=2.19.1-r0

# install less and vim
RUN apk add --no-cache less vim
RUN rm /usr/bin/vi && ln -s /usr/bin/vim /usr/bin/vi
RUN echo "set mouse=r" >> ~/.vimrc

# create git dir
# the /git directory is the default working dir and can be used to store the repository or repositories
# the /git-init.sh file can be used to run git config commands during container startup
RUN mkdir /git
RUN echo "cd /git" >> ~/.profile
RUN echo "if [ -e /git-init.sh ]; then source /git-init.sh; fi" >> ~/.profile

# load environment during container startup
CMD ["su", "-"]