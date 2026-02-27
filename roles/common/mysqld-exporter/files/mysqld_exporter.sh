#!/bin/bash

groupadd mysqld_exporter
useradd -g mysqld_exporter -s /bin/false -m mysqld_exporter
cp /home/ubuntu/mysqld_exporter-0.15.1.linux-amd64/mysqld_exporter /sbin/
chown root:root /sbin/mysqld_exporter