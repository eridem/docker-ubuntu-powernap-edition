FROM ubuntu:17.04
MAINTAINER Miguel Ángel Domínguez Coloma <m@eridem.net>

ENV ZSH=/root/.oh-my-zsh

RUN DEBIAN_FRONTEND=noninteractive apt-get -qq update && \
    apt-get -qq install -y nano git curl wget zsh net-tools
RUN chsh -s /bin/zsh && \
    env git clone --quiet --depth=1 https://github.com/robbyrussell/oh-my-zsh.git $ZSH && \
    cp $ZSH/templates/zshrc.zsh-template ~/.zshrc && \
    echo "echo 'Welcome to Ubuntu Powernap edition.'" >> ~/.zshrc

WORKDIR /root
ENTRYPOINT /bin/zsh
