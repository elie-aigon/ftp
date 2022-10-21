#!/bin/bash
apt install git-all -y
git clone https://github.com/elie-aigon/userlist.csv.git

export IFS=","
cat /root/userlist/userlist.csv| while read a b c d e || [ -n "$e" ]
do
	user="Id: $a Prénom: $b Nom: $c Mdp: $d Rôle: $e"
	log1="$b"_"$c"
	log2="${log1// /}"
	userpassword="$d"
	
	if [ $a="Id" ]
		then
			echo -ne "\$userpassword\n\$userpassword" | sudo adduser "$log2"
			echo "$log2" : "$userpassword"

	if [ $e="Admin" ]
		sudo usermod -aG sudo $log2
	fi	
done 






