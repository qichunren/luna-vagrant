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
sudo -u postgres psql -c "create database luna_production owner luna;"

sudo echo "host    all all 0.0.0.0/0 md5" >> /etc/postgresql/9.1/main/pg_hba.conf
sudo echo "listen_addresses='*'" >> /etc/postgresql/9.1/main/postgresql.conf
sudo service postgresql  restart

sudo apt-get -y install ruby1.9.3