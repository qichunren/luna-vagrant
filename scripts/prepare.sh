sudo mv /etc/apt/sources.list /etc/apt/sources.list_backup
sudo cp /code/luna-vagrant/files/sources.list /etc/apt/sources.list # 163.com source list
sudo apt-get update
sudo apt-get -y install vim