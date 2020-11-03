#!/bin/bash

##########################################################################
##########################################################################
##                                                                      ##
##      This script compiles the the following binaries                 ## 
##      **   node-exporter, near-exporter, nearcore    **               ##
##                                                                      ##
##########################################################################
##########################################################################



#################################################################################
##
##          Script Configuration
##
#################################################################################


#################################################################################
##
##          Install Apt Updates and required dev Tools
##
#################################################################################
echo '* Making sure all packages are updated and system is clean most everything was installed with cloud-init'
# Make sure ubuntu is updated and clean
sudo apt-get -qq update
sudo apt-get -qq upgrade
sudo apt-get -qq autoremove
sudo apt-get -qq autoclean


#################################################################################
##
##          Make swapfile and enable it
##
#################################################################################



#################################################################################
##
##          TODO: Docker install section
##
##          
#################################################################################



#################################################################################
##
##          Compile node_exporter & create tar of binaries for transfer
##
#################################################################################
#################################################################################
#               Disabled by default
# 
#    Name     | Description | OS
#    ---------|-------------|----
#    buddyinfo | Exposes statistics of memory fragments as reported by /proc/buddyinfo. | Linux
#    interrupts | Exposes detailed interrupts statistics. | Linux, OpenBSD
#    ksmd | Exposes kernel and system statistics from `/sys/kernel/mm/ksm`. | Linux
#    logind | Exposes session counts from [logind](http://www.freedesktop.org/wiki/Software/systemd/logind/). | Linux
#    ntp | Exposes local NTP daemon health to check [time](./docs/TIME.md) | _any_
#    processes | Exposes aggregate process statistics from `/proc`. | Linux
#    qdisc | Exposes [queuing discipline](https://en.wikipedia.org/wiki/Network_scheduler#Linux_kernel) statistics | Linux
#    systemd | Exposes service and system status from [systemd](http://www.freedesktop.org/wiki/Software/systemd/). | Linux
#    tcpstat | Exposes TCP connection status information from `/proc/net/tcp` and `/proc/net/tcp6`. (Warning: the current version has potential performance issues in high load situations.) | Linux
#    perf | Exposes perf based metrics (Warning: Metrics are dependent on kernel configuration and settings). | Linux
#################################################################################




#################################################################################
##
##  Compile near-exporter & create tar of binaries for transfer
##
#################################################################################




#################################################################################
##
##          Install Rust
##
#################################################################################




#################################################################################
##
##          Compile Nearcore
##
#################################################################################




#################################################################################
##
##                  FAIL2BAN
##
#################################################################################



#################################################################################
##
## !!!!!!!!!!!!  TODO: Git Repo
##
#################################################################################


