#!/bin/sh 



read -p "Enter Directory Name: " dirname
username=${PWD##*/}
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

echo "Check if Homebrew is installed if not install"

which -s brew
if [[ $? != 0 ]] ; then
    # Install Homebrew
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
    brew update
fi

echo "Install PHP7"
brew tap homebrew/dupes
brew tap homebrew/versions
brew tap homebrew/homebrew-php
brew install php70
brew install php70-intl

echo "Install dnsmasq"
brew install dnsmasq
cd $(brew --prefix)
mkdir etc
echo 'address=/.dev/127.0.0.1' > etc/dnsmasq.conf
sudo cp -v $(brew --prefix dnsmasq)/homebrew.mxcl.dnsmasq.plist /Library/LaunchDaemons
sudo launchctl load -w /Library/LaunchDaemons/homebrew.mxcl.dnsmasq.plist
sudo mkdir /etc/resolver
sudo bash -c 'echo "nameserver 127.0.0.1" > /etc/resolver/dev'

cd $CWD

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

