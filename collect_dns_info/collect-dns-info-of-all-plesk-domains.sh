#!/bin/bash 
#set -o verbose
#set -x
#set -v
#sed -e :a -e '$!N;s/ \n/,/;ta'

#start the file over and erase contents
echo '' > details.csv

#write the column headings
echo -e "domain,ip address,nameserver,mx server,local ip address,site hosted on same server?,email ip address,email hosted on this server?,number of hosted boxes" > details.csv

#acquire all email accounts on the server
servermailaccounts=`mysql -uadmin -p$(cat /etc/psa/.psa.shadow) -Dpsa -e "SELECT name AS 'DOMAIN', mail_name AS 'USERNAME', postbox as 'MAILBOX?', redir_addr as REDIRECT FROM mail M, domains D, accounts A WHERE M.account_id = A.id AND M.dom_id = D.id ORDER BY name,mail_name;"`

#echo `cat $servermailaccounts | awk '{print $1}'` > domains.txt

domain= `mysql -uadmin -p$(cat /etc/psa/.psa.shadow) -Dpsa -e "SELECT name AS 'DOMAIN' FROM mail M, domains D, accounts A WHERE M.account_id = A.id AND M.dom_id = D.id ORDER BY name;" | sort -u`

while read domain; do
	echo $domain 
	ipaddress=`host $domain | grep "address" | head -n1 | awk '{print $4}'`
	localipaddress=`/usr/local/psa/bin/domain --info $domain | grep IP | awk '{print $3}'`
	
	#list all DNS servers with space in between  
	#nameserver=`whois $domain | grep "Name Server"| cut -d ":" -f 2 | sed 's/ //' | sed -e :a -e '$!N;s/\n/ /;ta'`
	
	#list only first DNS server
	#nameserver=`whois $domain | grep "Name Server" | cut -d ":" -f 2 | head -n1 | cut -c 2-`
	nameserver=`dig $domain NS +noall +answer | head -1 | awk '{print $5}' | sed s'/\.$//'`
	
	mx=`dig $domain mx +short | head -n1 | cut -d " " -f 2 | sed s'/\.$//'`
	emailipaddress=`host $mx | grep "address" | head -n1 | awk '{print $4}'`
	# numberofhostedboxes=`echo $servermailaccounts | grep $domain -o | wc -l | sed -e 's/^[ \t]*//'`
	numberofhostedboxes=`echo $servermailaccounts | grep $domain -o | wc -l`
	# echo $servermailaccounts | grep $domain -o | wc -l
	
	if [ $localipaddress = $emailipaddress ]
	then
	    emailhostedhere="true"
	else
		emailhostedhere="false"
	fi

	if [ $localipaddress = $ipaddress ]
	then
	    sitehostedhere="true"
	else
		sitehostedhere="false"
	fi

	echo -e "$domain,$ipaddress,$nameserver,$mx,$localipaddress,$sitehostedhere,$emailipaddress,$emailhostedhere,$numberofhostedboxes" >> details.csv

done