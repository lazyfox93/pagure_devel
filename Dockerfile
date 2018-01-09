FROM fedora:27
RUN dnf install -y \
        git \
        python2-devel\
        python-pip \
        libgit2-devel \
        libjpeg-devel \
        gcc libffi-devel \
        redhat-rpm-config \
        redis \
        tmux \
        vim
COPY . /pagure/
WORKDIR /pagure/
RUN chmod a+x ./*.sh
RUN ./install_pygit2.sh
RUN mkdir -p ../lcl/{repos,docs,forks,tickets,requests,remotes,attachments,releases}
RUN pip install -r ./requirements.txt
CMD  /bin/bash
