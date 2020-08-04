FROM ubuntu:18.04
RUN apt update && \
    apt install wget zip curl git -y
RUN wget https://releases.hashicorp.com/terraform/0.12.29/terraform_0.12.29_linux_amd64.zip && \
    unzip terraform*.zip && \
    mv terraform /usr/local/bin
RUN curl -L https://github.com/stelligent/config-lint/releases/latest/download/config-lint_Linux_x86_64.tar.gz | tar xz -C /usr/local/bin config-lint && \
    chmod +rx /usr/local/bin/config-lint
RUN mkdir /root/TFCode
WORKDIR /root/TFCode
COPY tfrun.sh /root/TFCode
RUN chmod 755 tfrun.sh && \
    ./tfrun.sh
CMD ["/bin/bash", "-D"]
