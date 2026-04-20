FROM ubuntu:focal
LABEL maintainer="danleyb2.dev"
ENV DEBIAN_FRONTEND=noninteractive

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

RUN curl -OLsSf 'https://www.passmark.com/downloads/PerformanceTest_Linux_x86-64.zip' \
  -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7' \
  -H 'Accept-Language: en' \
  -H 'Connection: keep-alive' \
  -H 'Sec-Fetch-Dest: document' \
  -H 'Sec-Fetch-Mode: navigate' \
  -H 'Sec-Fetch-Site: none' \
  -H 'Sec-Fetch-User: ?1' \
  -H 'Upgrade-Insecure-Requests: 1' \
  -H 'User-Agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36' \
  -H 'sec-ch-ua: "Chromium";v="146", "Not-A.Brand";v="24", "Google Chrome";v="146"' \
  -H 'sec-ch-ua-mobile: ?0' \
  -H 'sec-ch-ua-platform: "Linux"' && unzip PerformanceTest_Linux_x86-64.zip && rm -f PerformanceTest_Linux_x86-64.zip \ 
    && mv PerformanceTest/PerformanceTest_Linux_x86-64 /pt_linux_x64 && chmod +x /pt_linux_x64

COPY init.sh /init.sh
RUN chmod u+x /init.sh


ENTRYPOINT ["/init.sh"]
