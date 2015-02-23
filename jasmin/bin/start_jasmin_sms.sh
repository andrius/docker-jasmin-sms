#!/bin/sh

/etc/init.d/rabbitmq-server start
/etc/init.d/redis-server start
echo "Jasmin SMS server"
su - jasmin -c "python /usr/local/bin/jasmind.py --username jcliadmin --password jclipwd"
