#!/bin/bash

cp /home/ubuntu/alertmanager-0.27.0.linux-amd64/alertmanager /sbin/
cp /home/ubuntu/alertmanager-0.27.0.linux-amd64/amtool /sbin/
chown root:root /sbin/alertmanager /sbin/amtool
mkdir /etc/prometheus/
groupadd prometheus
cp /home/ubuntu/alertmanager-0.27.0.linux-amd64/alertmanager.yml /etc/prometheus/
chown -R root:prometheus /etc/prometheus
mkdir /var/lib/alertmanager
chown -R prometheus:prometheus /var/lib/alertmanager