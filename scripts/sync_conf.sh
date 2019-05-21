#!/bin/bash

hosts='node1 node2 harbor'

for host in $hosts
do
    echo "===== Pushing conf to [$host] ====="
    scp ~/container_lab/system_settings/bashrc $host:~/.bashrc
    scp ~/.ssh/authorized_keys $host:~/.ssh/authorized_keys
    scp /etc/hosts $host:/etc/hosts
done
