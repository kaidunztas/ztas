FROM debian
ARG sun_port=7500
WORKDIR /ztas/bin
# RUN apt-get update && apt-get install -y locales && rm -rf /var/lib/apt/lists/* \
#     && localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF8
# RUN sed -i 's#http://deb.debian.org#https://mirrors.163.com#g' /etc/apt/sources.list && apt-get update && apt-get install -y locales && rm -rf /var/lib/apt/lists/*
ENV LANG en_US.UTF8
ENV SUN_PORT $sun_port
COPY ./bin/ztas_sunp2p ./.
#Setup and install ztas_sunp2p service
RUN ./ztas_sunp2p setup -p $sun_port -b 0.0.0.0
