#!/bin/sh

mkdir -p jasmin/etc/jasmin/resource \
         jasmin/etc/jasmin/init-d \
         jasmin/etc/jasmin/init-script \
         jasmin/etc/jasmin/store \
         jasmin/var/log/jasmin \
         jasmin/var/run/jasmin

docker build -t andrius/jasmin_sms .
