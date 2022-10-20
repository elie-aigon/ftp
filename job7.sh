#!/bin/bash
#script doit etre lancé depuis su-
#configuration du serveur FTP
apt update & apt upgrade
apt install proftpd-* -y
systemctl start proftpd
systemctl enable proftpd
#création users
sudo adduser merry | sudo chpasswd kalimac
sudo adduser pippin | sudo chpasswd secondbreakfast
#modification du fichier proftpd.conf

mv /etc/proftpd/proftpd.conf /etc/proftpd/proftpd.conf.backup
mv /etc/proftpd/tls.conf /etc/proftpd/tls.conf.backup
mv /etc/proftpd/modules.conf /etc/proftpd/modules.conf.backup

mv /fichier.conf/fichier.conf/proftp.conf /etc/proftpd/
mv /fichier.conf/fichier.conf/tls.conf /etc/proftpd/
mv /fichier.conf/fichier.conf/modules.conf /etc/proftpd/

systemctl restart proftpd

