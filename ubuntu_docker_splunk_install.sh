#!/bin/sh
#Run this script on ubuntu: wget -O - https://raw.githubusercontent.com/jessin08/splunk/master/ubuntu_docker_splunk_install.sh | bash
#docker command: docker run -d -p 8000:8000 --name ubuntu ubuntu
#docker command: docker exec -it ubuntu
#Bypass lockcheck for splunk: OPTIMISTIC_ABOUT_FILE_LOCKING=1 > $SPLUNK_HOME/etc/splunk-launch.conf

apt-get update
echo -e "\n-----------------------\nInstalling wget and VIM\n-----------------------\n"
apt-get install wget vim
echo -e "\n---------------------------------\nDownloading and extracting splunk\n---------------------------------\n"
wget -O splunk-8.0.2-a7f645ddaf91-Linux-x86_64.tgz 'https://www.splunk.com/bin/splunk/DownloadActivityServlet?architecture=x86_64&platform=linux&version=8.0.2&product=splunk&filename=splunk-8.0.2-a7f645ddaf91-Linux-x86_64.tgz&wget=true'
mv splunk-8.0.2-a7f645ddaf91-Linux-x86_64.tgz /opt/splunk-8.0.2-a7f645ddaf91-Linux-x86_64.tgz
tar -xvzf splunk-8.0.2-a7f645ddaf91-Linux-x86_64.tgz
cd /opt/splunk
echo -e "\n---------------------------------\nremoving splunk installation file\n---------------------------------\n"
rm -rf ../splunk-8.0.2-a7f645ddaf91-Linux-x86_64.tgz
echo "\n----------------------------------\nAutostart script for the container\n----------------------------------\n"
echo -e '#!/bin/sh\n/opt/splunk/bin/splunk start' > /etc/init.d/startupscript.sh
chmod +x /etc/init.d/startupscript.sh

