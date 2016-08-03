#!/bin/sh 


read -p "Enter Directory Name: " dirname
read -p "Enter  Username: " username
CWD="$(pwd)"
if [[ ! -d "$dirname" ]]
then
        if [[ ! -L $dirname ]]
        then
                echo "Directory doesn't exist. Creating now"
                mkdir $dirname
                cd $dirname
                mkdir home
                mkdir client

        else
                cd dirname
                mkdir home
                mkdir client
        fi
fi

startdirectory="$CWD/apache2"

searchterm="%%ROOTFOLDER%%"

replaceterm="/Users/$username/$dirname"
echo $replaceterm

tempfile="/tmp/out.tmp.$$"
i=0; 

  for file in $(grep -l -R $searchterm $startdirectory)
    do
     sed -i "" "s|${searchterm}|${replaceterm}|g" $file
    let i++;  

      echo "Modified: " $file
    done

echo " *** All Done! *** Modified files:" $i