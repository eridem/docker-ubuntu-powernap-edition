FROM ubuntu:16.04
MAINTAINER Miguel Ángel Domínguez Coloma <m@eridem.net>

ENV DEBIAN_FRONTEND=noninteractive \
    ZSH=/root/.oh-my-zsh \
    TERRAFORM_VERSION=0.9.6 \
    NOMAD_VERSION=0.5.6 \
    CONSUL_VERSION=0.8.3 \
    VAULT_VERSION=0.7.2

# Ubuntu tools
RUN apt-get -qq update && \
    apt-get -qq install -y nano git curl wget zsh net-tools unzip man jq

# ZSH
RUN chsh -s /bin/zsh && \
    env git clone --quiet --depth=1 https://github.com/robbyrussell/oh-my-zsh.git ${ZSH} && \
    cp ${ZSH}/templates/zshrc.zsh-template ~/.zshrc && \
    sed -i'' -r 's/robbyrussell/bureau/g' ~/.zshrc && \
    sed -i'' -r 's/git/git docker/g' ~/.zshrc

# Docker
RUN apt-get -qq install -y apt-transport-https ca-certificates software-properties-common && \
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add - && \
    add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" && \
    apt update && \
    apt-get -qq install -y docker-ce

# Hashicorp (Terraform, Nomad, Consul, Vault)
RUN curl -o /tmp/hashicorp-terraform.zip https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
    curl -o /tmp/hashicorp-nomad.zip     https://releases.hashicorp.com/nomad/${NOMAD_VERSION}/nomad_${NOMAD_VERSION}_linux_amd64.zip && \ 
    curl -o /tmp/hashicorp-consul.zip    https://releases.hashicorp.com/consul/${CONSUL_VERSION}/consul_${CONSUL_VERSION}_linux_amd64.zip && \ 
    curl -o /tmp/hashicorp-vault.zip     https://releases.hashicorp.com/vault/${VAULT_VERSION}/vault_${VAULT_VERSION}_linux_amd64.zip && \ 
    unzip /tmp/hashicorp-terraform.zip   -d /usr/local/bin && \
    unzip /tmp/hashicorp-nomad.zip       -d /usr/local/bin && \
    unzip /tmp/hashicorp-consul.zip      -d /usr/local/bin && \
    unzip /tmp/hashicorp-vault.zip       -d /usr/local/bin && \
    rm -rf /tmp/hashicorp-*.zip

# Uninstall unnecessary items
RUN apt-get -qq purge -y apt-transport-https ca-certificates software-properties-common

# Copy entrypoint
COPY entrypoint.sh /

ENV DEBIAN_FRONTEND=
WORKDIR /root
ENTRYPOINT ["/entrypoint.sh"]
