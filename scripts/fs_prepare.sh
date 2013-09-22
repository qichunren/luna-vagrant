sudo mv /etc/apt/sources.list /etc/apt/sources.list_backup
sudo cp /code/luna-vagrant/files/sources.list.12.04.163 /etc/apt/sources.list # 163.com source list
sudo apt-get update

# Fix for GPG error: http://extras.ubuntu.com maverick Release
gpg –keyserver keyserver.ubuntu.com –recv 3E5C1192
gpg –export –armor 3E5C1192 | sudo apt-key add -
sudo apt-get update

sudo apt-get -y install build-essential autoconf openssl libssl-dev libcurl4-openssl-dev curl vim git  \
  bison libreadline6 libreadline6-dev zlib1g zlib1g-dev libyaml-dev libsqlite3-0 libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev  libsasl2-dev

sudo apt-get -y install  postgresql libpq-dev

sudo -u postgres psql -c "create user luna with password 'luna';"
sudo -u postgres psql -c "CREATE DATABASE luna_production WITH OWNER luna ENCODING 'UTF8';"
# sudo -u postgres psql -c "DROP DATABASE luna_production;"

sudo echo "host    all all 0.0.0.0/0 md5" >> /etc/postgresql/9.1/main/pg_hba.conf
sudo echo "listen_addresses='*'" >> /etc/postgresql/9.1/main/postgresql.conf
sudo service postgresql  restart

sudo apt-get -y install ruby1.9.3

# cd /code
# wget http://c2h2pro.3322.org:81/lunafs-release/lunafs-with-sound-release_2-20130918.1140GIT805732e939664f584a736544b28cf23228198fee_amd64.deb
# sudo dpkg -i http://c2h2pro.3322.org:81/lunafs-release/lunafs-with-sound-release_2-20130918.1140GIT805732e939664f584a736544b28cf23228198fee_amd64.deb
# export http_proxy=10.0.1.45:1078
# sudo gem install bundler

# sudo apt-get -y install nodejs memcached rabbitmq-server dos2unix

# 将自己主机器中的ssh key复制到虚拟机中
# cd ~/.ssh/
# cp id_rsa id_rsa.pub ~/code/work
# mv id_rsa id_rsa.pub ~/.ssh