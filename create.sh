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
               
                mkdir projects

        else
                cd dirname
                
                mkdir project
        fi
fi

apachedirectory="$CWD/apache2"
homedirectory="$CWD/home"

searchterm="%%ROOTFOLDER%%"

replaceterm="/Users/$username/$dirname"



i=0; 

  for file in $(grep -l -R $searchterm $apachedirectory)
    do
     sed -i "" "s|${searchterm}|${replaceterm}|g" $file
    let i++;  

      echo "Modified: " $file
    done

echo " *** All Apache Files *** Modified files:" $i

ii=0; 

  for file in $(grep -l -R $searchterm $homedirectory)
    do
     sed -i "" "s|${searchterm}|${replaceterm}|g" $file
    let ii++;  

      echo "Modified: " $file
    done

echo " *** All Home Files *** Modified files:" $ii

echo "** Moving Home directory "
mv $homedirectory ~/$dirname

echo "**  Move Apache Files will require sudo password"

sudo cp -af $apachedirectory /private/etc

echo "Delete src apache2 directory"
rm -rf $apachedirectory

echo "File will now self destruct"
rm -f ~/create.sh

