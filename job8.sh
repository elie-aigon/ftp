#!/bin/bash

#le script doit être lancé depuis root.

apt --purge remove proftpd-* -y
deluser merry
deluser pippin

