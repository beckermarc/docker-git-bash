FROM bash:4.4

# set the default shell to bash
RUN ln -s /usr/local/bin/bash /bin/bash && \
    sed -i -e "s/bin\/ash/bin\/bash/" /etc/passwd

# install utilities
RUN apk add --no-cache  less \
                        vim \
                        man \
                        man-pages \
                        mdocml-apropos \
                        bash-completion && \
    rm /usr/bin/vi && \
    ln -s /usr/bin/vim /usr/bin/vi && \
    echo "set mouse=r" >> ~/.vimrc && \
    echo "set expandtab" >> ~/.vimrc && \
    echo "set tabstop=4" >> ~/.vimrc && \
    echo "autocmd FileType yml,yaml set tabstop=2" >> ~/.vimrc

# install git
RUN apk add --no-cache git-doc git && \
    git --version

# create git dir and set ~/.profile configuration
# the /git directory is the default working dir and can be used to store the repository or repositories
# the /git-init.sh file can be used to run git config commands during container startup
RUN mkdir /git && \
    echo "cd /git" >> ~/.profile && \
    echo "if [ -e /git-init.sh ]; then source /git-init.sh; fi" >> ~/.profile

# load environment during container startup
CMD ["su", "-"]
