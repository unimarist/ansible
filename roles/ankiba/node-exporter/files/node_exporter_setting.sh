#!/bin/bash

groupadd node_exporter
useradd -g node_exporter -s /bin/false -m node_exporter
cp /home/ubuntu/node_exporter-1.8.2.linux-amd64/node_exporter /sbin/
chown root:root /sbin/node_exporter