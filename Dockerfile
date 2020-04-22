FROM centos:7

ENV WD=/wd
ENV BUILD_DIR=/build-iso

RUN yum clean all && \
    yum -y install xorriso && \
    yum clean all && \
    mkdir /build-iso && \
    curl -o /usr/local/bin/yq -L -v https://github.com/mikefarah/yq/releases/download/3.3.0/yq_linux_amd64 && \
    chmod +x /usr/local/bin/yq && \
    curl -v -L -o /usr/local/bin/ct https://github.com/coreos/container-linux-config-transpiler/releases/download/v0.8.0/ct-v0.8.0-x86_64-unknown-linux-gnu && \
    chmod +x /usr/local/bin/ct

RUN mkdir /wd && mkdir /build-iso

WORKDIR "/wd"

CMD ["/bin/bash"]