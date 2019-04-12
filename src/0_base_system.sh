#!/bin/bash -e

apt-get update && apt-get upgrade -y
apt-get install -y --no-install-recommends curl gettext-base net-tools locales libglib2.0-0

/usr/sbin/useradd --create-home --home-dir /arcgis --shell /bin/bash arcgis
locale-gen en_US.UTF-8

echo "arcgis soft nofile 65535" > /etc/security/limits.conf
echo "arcgis hard nofile 65535" >> /etc/security/limits.conf
echo "arcgis soft nproc 25059" >> /etc/security/limits.conf
echo "arcgis hard nproc 25059" >> /etc/security/limits.conf

# apt-get remove -y locales
apt-get autoremove -y
rm -rf /var/lib/apt/lists/*
