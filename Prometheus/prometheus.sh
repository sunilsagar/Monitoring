#!/usr/bin/env bash
# Purpose : To automate the installation of promtheus using yum
# Author : Sunil Sagar

## Script Begins

# Define variables
cksum_prometheus_repo="$(curl https://raw.githubusercontent.com/sunilsagar/Monitoring/master/Monitoring/Prometheus/cksum_prometheus.repo)"

# Download the repo file on server
curl "https://raw.githubusercontent.com/sunilsagar/Monitoring/master/Monitoring/Prometheus/prometheus.repo" > /etc/yum.repos.d/prometheus.repo
sleep 1

# Validate if downloaded file is correct
cksum_downloaded_file="$(cksum /etc/yum.repos.d/prometheus.repo | awk '{print $1}')"
if [ ${cksum_downloaded_file} != ${cksum_prometheus_repo} ] ; then
  echo "File prometheus.repo file is corrupted, please validate"
  exit
else
  yum install prometheus -y
  echo "Staring Prometheus Service"; sleep 1
  systemctl start prometheus.service
  echo "Enabled Prometheus to auto-restart after reboot"; sleep 1
  systemctl enable prometheus.service

  echo "----------------------------------------------------------"
  echo "Prometheus Status"
  echo "----------------------------------------------------------"
  systemctl status prometheus.service
fi

## Script Ends
