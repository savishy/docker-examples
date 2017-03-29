#!/bin/bash
NAGIOS_BASEDIR=/opt/nagios_data
NAGIOS_ETCDIR="$NAGIOS_BASEDIR/opt/nagios/etc"
NAGIOS_VARDIR="$NAGIOS_BASEDIR/opt/nagios/var"
NAGIOS_PLUGINDIR="$NAGIOS_BASEDIR/opt/Custom-Nagios-Plugins"

echo "-- Creating Local Directories"
for i in $NAGIOS_ETCDIR $NAGIOS_VARDIR $NAGIOS_PLUGINDIR; do
  if [[ ! -d "$i" ]]; then
    sudo mkdir -p -v $i
    sudo chmod -v -R 777 $i
  fi
done

echo "-- Deleting previous Nagios containers"
prevContId=`docker ps -aq -f "ancestor=jasonrivers/nagios"`
if [[ ! $prevContId == "" ]]; then
    docker rm -f $prevContId
fi

echo "-- Launching Nagios Docker Container"
docker run -d --name nagios-container  \
  -v /opt/nagios_data/opt/nagios/etc/:/opt/nagios/etc/ \
  -v /opt/nagios_data/opt/nagios/var:/opt/nagios/var/ \
  -v /opt/nagios_data/opt/Custom-Nagios-Plugins:/opt/Custom-Nagios-Plugins \
  -p 8080:80 jasonrivers/nagios:latest
