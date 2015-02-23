#!/bin/sh

#docker run --restart=always \
#  -v "`pwd`/jasmin/etc/jasmin:/etc/jasmin" \
#  -v "`pwd`/jasmin/var/log/jasmin:/var/log/jasmin" \
#  -v "`pwd`/jasmin/var/run/jasmin:/var/run/jasmin" \
#  --name jasmin_sms -d -t andrius/jasmin_sms

docker run --restart=always --name jasmin_sms -d -t andrius/jasmin_sms
