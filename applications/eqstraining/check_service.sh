#!/bin/bash
service=eqstraining
dt=`date '+%d/%m/%Y %H:%M:%S'`
if (systemctl is-active --quiet $service)
then
echo "$dt:INFO:$service is running!!!"
else
echo "$dt:ERROR:$service is not running!!!"
sudo service $service restart
sleep 60
sudo systemctl is-active --quiet eqstraining && echo Service eqstraining is running && sudo service eqstraining status
echo "$service was restarted!!!"
fi
