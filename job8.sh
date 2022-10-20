#!/bin/bash

#le script doit être lancé depuis root.

apt --purge remove proftpd-*
deluser merry
deluser pippin

