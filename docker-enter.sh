#!/bin/sh

sudo /usr/local/bin/nsenter \
  --target $(docker inspect --format "{{.State.Pid}}" $(docker ps | grep 'andrius\/jasmin_sms' | cut -d ' ' -f1)) \
  --mount --uts --ipc --net --pid bash
