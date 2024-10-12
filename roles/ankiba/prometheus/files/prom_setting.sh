#!/bin/bash

groupadd prometheus
useradd -d /var/lib/prometheus -g prometheus -s /bin/false -m prometheus
cp /home/ubuntu/prometheus-2.53.1.linux-amd64/prometheus /sbin/
cp /home/ubuntu/prometheus-2.53.1.linux-amd64/promtool /sbin/
chown root:root /sbin/prometheus /sbin/promtool
mkdir /etc/prometheus
mkdir /var/lib/prometheus/data
chown -R prometheus:prometheus /var/lib/prometheus
cp -r /home/ubuntu/prometheus-2.53.1.linux-amd64/* /etc/prometheus/
chown -R root:prometheus /etc/prometheus