# FROM python:2.7.8-onbuild
FROM python:2.7-onbuild

MAINTAINER Andrius Kairiukstis <andrius@kairiukstis.com>

ENV DEBIAN_FRONTEND noninteractive

#ADD jasmin/etc/jasmin /etc/jasmin
#ADD jasmin/var/log/jasmin /var/log/jasmin
#ADD jasmin/var/run/jasmin /var/run/jasmin

RUN adduser --quiet --disabled-password -shell /bin/bash --home /home/jasmin --gecos "Jasmin SMS" jasmin \
&& mkdir -p /etc/jasmin/resource \
            /etc/jasmin/init-d \
            /etc/jasmin/init-script \
            /etc/jasmin/store \
            /var/log/jasmin \
            /var/run/jasmin

COPY ./jasmin/bin/start_jasmin_sms.sh /usr/bin/start_jasmin_sms.sh

RUN apt-get update \
&& apt-get --yes -qq install telnet python-dev libffi-dev libssl-dev \
                             rabbitmq-server redis-server \
                             unzip \

&& chown -R jasmin:jasmin /etc/jasmin /var/log/jasmin /var/run/jasmin \
&& wget --continue --quiet https://github.com/fourat/jasmin/archive/v0.6-beta.zip \
&& unzip v0.6-beta.zip \
&& cd jasmin-0.6-beta \
&& python setup.py sdist \
&& pip install dist/jasmin-0.6b0.tar.gz \
&& ln -s /usr/src/app/app.sh /home/jasmin/ \
&& ln -s /etc/jasmin/init-script/jasmind /etc/init.d/ \
&& cd .. \

&& rm -rf v0.6-beta.zip jasmin-0.6-beta \
&& apt-get --yes -qq purge unzip \
&& apt-get clean all \
&& rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
&& chown -R jasmin:jasmin /etc/jasmin /var/log/jasmin /var/run/jasmin

CMD ["/usr/bin/start_jasmin_sms.sh"]
