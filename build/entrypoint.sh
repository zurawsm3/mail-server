#!/bin/bash

service spamassassin start
service rsyslog start
service postfix start
#opendkim-genkey -D /etc/opendkim/keys/podniesieniezatoki.pl/ -r -d podniesieniezatoki.pl -s MYSELECTOR
dovecot -F
