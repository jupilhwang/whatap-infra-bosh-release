#!/usr/bin/env bash

#RUN_DIR=/var/vcap/sys/run/whatap    # PIP file in here
#LOG_DIR=/var/vcap/sys/log/whatap

WHATAP_CONF="/usr/whatap/infra/conf/whatap.conf"

if [ ! -f ${WHATAP_CONF} ]; then

  sudo dpkg -i /var/vcap/packages/whatap-infra/whatap-infra_*_amd64.deb

  echo "license=<%= p('license') %>" |sudo tee /usr/whatap/infra/conf/whatap.conf
  echo "whatap.server.host=<%= p('server_host') %>" |sudo tee -a /usr/whatap/infra/conf/whatap.conf
  echo "createdtime=`date +%s%N`" |sudo tee -a /usr/whatap/infra/conf/whatap.conf

fi

case $1 in
  start)
    sudo service whatap-infra restart

    ;;
  
  stop)
    sudo service whatap-infra stop

    ;;
  
  *)
    echo "Usage: ctl {restart|stop}"

esac