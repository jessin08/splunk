#!/bin/sh
#Run this script on ubuntu: wget -O - https://raw.githubusercontent.com/jessin08/splunk/master/ubuntu_docker_splunk_install.sh | bash
#docker command: docker run -d -p 8000:8000 --name ubuntu ubuntu
#docker command: docker exec -it ubuntu

apt-get update
echo "Installing wget and VIM"
apt-get install wget vim
echo "Downloading and extracting splunk"
wget -O splunk-8.0.2-a7f645ddaf91-Linux-x86_64.tgz 'https://www.splunk.com/bin/splunk/DownloadActivityServlet?architecture=x86_64&platform=linux&version=8.0.2&product=splunk&filename=splunk-8.0.2-a7f645ddaf91-Linux-x86_64.tgz&wget=true'
mv splunk-8.0.2-a7f645ddaf91-Linux-x86_64.tgz /opt/splunk-8.0.2-a7f645ddaf91-Linux-x86_64.tgz
tar -xvzf splunk-8.0.2-a7f645ddaf91-Linux-x86_64.tgz
cd splunk-8.0.2-a7f645ddaf91-Linux-x86_64
echo "removing splunk installation file"
rm -rf ../splunk-8.0.2-a7f645ddaf91-Linux-x86_64.tgz

