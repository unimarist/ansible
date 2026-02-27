#!/bin/bash

groupadd blackbox_exporter
useradd -g blackbox_exporter -s /bin/false -m blackbox_exporter
cp /home/ubuntu/blackbox_exporter-0.25.0.linux-amd64/blackbox_exporter* /sbin/
chown root:root /sbin/blackbox_exporter
cp /home/ubuntu/blackbox_exporter-0.25.0.linux-amd64/blackbox.yml /home/blackbox_exporter
