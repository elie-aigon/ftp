#!/bin/bash

export IFS=","
cat Backup/Shell_Userlist_old.csv| while read a b c d e || [ -n "$e" ]
do
	user="Id: $a Prénom: $b Nom: $c Mdp: $d Rôle: $e"
	log1="$b"_"$c"
	log2="${log1// /}"
	userpassword="$d"
	
	if [ $a="Id" ]
		then
			sudo deluser "$log2" 
	fi	
done 

export IFS=","
cat Shell_Userlist.csv| while read a b c d e || [ -n "$e" ]
do
	user="Id: $a Prénom: $b Nom: $c Mdp: $d Rôle: $e"
	log1="$b"_"$c"
	log2="${log1// /}"
	userpassword="$d"
	
	if [ $(grep "^$e" /etc/group) ]
		then 
			echo "Le groupe existe déjà"
	else 
		sudo groupadd user
	fi
	
	if [ $a="Id" ]
		then
			sudo useradd "$log2" | sudo chpasswd "$userpassword"	
			sudo deluser "$log2"

	case $e in
		*"Admin"* ) sudo usermod -aG sudo $log2;;
		*"User"* ) sudo usermod -aG user $log2;;
	esac	
	fi	
done 

#Backup
cp Shell_Userlist.csv Backup/Shell_Userlist_old.csv 




