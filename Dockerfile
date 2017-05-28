FROM ubuntu:17.04
MAINTAINER Miguel Ángel Domínguez Coloma <m@eridem.net>

ENV ZSH=/root/.oh-my-zsh

RUN DEBIAN_FRONTEND=noninteractive apt-get -qq update
RUN DEBIAN_FRONTEND=noninteractive apt-get -qq install -y nano git curl wget zsh
RUN chsh -s /bin/zsh
RUN env git clone --quiet --depth=1 https://github.com/robbyrussell/oh-my-zsh.git $ZSH && \
    cp $ZSH/templates/zshrc.zsh-template ~/.zshrc
RUN echo "echo 'Welcome to Ubuntu Powernap edition.'" >> ~/.zshrc

WORKDIR /root
ENTRYPOINT /bin/zsh
