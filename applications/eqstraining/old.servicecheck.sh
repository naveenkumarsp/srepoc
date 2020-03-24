#!/bin/bash
service=eqstraining
dt=`date '+%d/%m/%Y %H:%M:%S'`
if (( $(ps -ef | grep -v grep | grep $service | wc -l) > 0 ))
then
echo "$dt:INFO:$service is running!!!"
else
echo "$dt:ERROR:$service is not running!!!"
sudo service $service restart
systemctl is-active --quiet eqstraining && echo Service eqstraining is running && sudo service eqstraining status
echo "$service was restarted!!!"
fi
