#!/bin/sh
##
## usage: sh getIPs.sh FILENAME(s)
##

## remove any legacy files
echo
echo "**************************"
echo "* Removing old files ... *"
echo "**************************"
echo
rm -v ogList.tsv sanitizedList.tsv ipList.tsv pingList.txt finalList.tsv

## exit if there is no file fed
if [ -z "$@" ]; then
  echo
  echo "You must specify an input file(s)."
  echo
  exit 1
fi

echo
echo "*******************************"
echo "* Beginning the ping-fest ... *"
echo "*******************************"
echo

## output to a filename that won't confuse the shell, and remove the top two lines
sed '1,2d' "$@" > ogList.tsv

## only grab the columns we need,
## assuming site name and url are in the first two columns
awk -F"\t" '{ print $1 "\t" $2 }' ogList.tsv > sanitizedList.tsv
## sanitize the output by removing slashes and http: thingamajigs
## change the number in awk to whatever column holds the urls
awk -F"\t" '{ print $2 }' sanitizedList.tsv | sed 's@http://@@g' | sed 's@/@@g' > ipList.tsv

## do the digging
for URL in $(cat ipList.tsv)
  do
    ## thanks to Milo Jennings
    PREFIX="www."
    ROOT_DOMAIN=${URL#$PREFIX}
    PUBLIC_IP=`dig $ROOT_DOMAIN +noall +answer | grep $ROOT_DOMAIN | tail -1 | awk '{print $5}'`
    echo "pinging $ROOT_DOMAIN // IP: $PUBLIC_IP"
    if [ -z "`echo $PUBLIC_IP | grep [0-9]`" ]; then
      ALTERNATE_IP=`dig $URL +noall +answer | grep $URL | tail -1 | awk '{print $5}'`
      if [ -z "`echo $ALTERNATE_IP | grep [0-9]`" ]; then
        echo "INVALID" >> pingList.txt
      else
        echo "$ALTERNATE_IP" >> pingList.txt
      fi
    else
      echo "$PUBLIC_IP" >> pingList.txt
    fi
done

echo
echo "*******************"
echo "* Almost done ... *"
echo "*******************"
echo

## finally print out the IPs back into the copied file,
## giving us a usable .tsv
paste sanitizedList.tsv pingList.txt | column -s $'\t' -t > finalList.tsv

echo
echo "*********************"
echo "* That's all folks! *"
echo "*********************"
echo
