#!/usr/bin/env bash
# Purpose : This script will give menu options for all the scrips

## Script Begins

# Prometheus
function prometheus() {
  /bin/sh <prometheus_file>
}

# Grafana
function grafana() {
  /bin/sh grafana.sh
}

# Telegraf
function telegraf() {
  /bin/sh telegraf.sh
}

case package in

  1)
    prometheus
    ;;

  2)
    grafana
    ;;

  3)
    telegraf
    ;;

  *)
    echo -n "You input wrong option, rerun script"
    ;;
esac


## Script Ends
