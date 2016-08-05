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
                mkdir projects
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

echo "Installing phpmyadmin"
curl -O https://files.phpmyadmin.net/phpMyAdmin/4.6.3/phpMyAdmin-4.6.3-all-languages.zip
unzip phpMyAdmin-4.6.3-all-languages.zip
mv phpMyAdmin-4.6.3-all-languages phpmyadmin
mv phpmyadmin ~/Sites/
rm phpMyAdmin-4.6.3-all-languages.zip


phpmyadminconfigsample="/Users/$username/$dirname/phpmyadmin/config.sample.inc.php"
phpmyadminconfig="/Users/$username/$dirname/phpmyadmin/config.inc.php" 
echo "Add Blow fish secret to phpmyadmin"
echo "Add Blow fish secret to phpmyadmin"
sed -e "s|cfg\['blowfish_secret'\] = '';|cfg['blowfish_secret'] = 'qtdRoGmbc9{8IZr323xYcSN]0s)r$9b_JUnb{~Xz';|g" $phpmyadminconfigsample  > $phpmyadminconfig

echo "Restarting apache"
sudo apachectl -k restart

echo "File will now self destruct"
rm -f ~/create.sh

