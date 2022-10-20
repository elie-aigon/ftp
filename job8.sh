#!/bin/bash

#le script doit être lancé depuis root.

apt --purge remove proftpd-* -y
apt --purge remove openssl-* -y
deluser merry
deluser pippin

