FROM ubuntu:focal
LABEL maintainer="danleyb2"
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        apt-transport-https \
        ca-certificates \
        curl \
        dmidecode \
        libncurses5 \
        openssh-server \
        passwd \
        python3 \
        sudo \
        unzip \
    && rm -rf /var/lib/apt/lists/* \
    && rm -Rf /usr/share/doc && rm -Rf /usr/share/man \
    && apt-get clean

RUN curl -O https://www.passmark.com/downloads/pt_linux_x64.zip \
    && unzip pt_linux_x64.zip \    
    && rm -f pt_linux_x64.zip \
    && chmod +x ./PerformanceTest/pt_linux_x64 

COPY init.sh /usr/local/bin/

RUN chmod u+x /usr/local/bin/init.sh
WORKDIR /PerformanceTest

ENTRYPOINT ["init.sh"]
