#!/usr/bin/env bash
# Purpose : Consolidate all the script to provide menu
# Author : Sunil Sagar

## Script Begins

# Download Repo
function download() {
  curl -L -o /tmp/monitoring.zip https://github.com/sunilsagar/Monitoring/archive/refs/heads/master.zip
  cd /tmp
  /bin/unzip /tmp/monitoring.zip
  find /tmp/Monitoring-master -type f -name '*.sh' -exec chmod 755 {} \;
}

#function run_main_script() {
#  /bin/sh <file_name>
#}

download;
#run_main_script;

## Script Ends
