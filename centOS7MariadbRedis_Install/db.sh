#sudo yum remove firewalld -y
#sudo yum install firewalld -y
sudo rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
sudo rpm -Uvh https://mirror.webtatic.com/yum/el7/webtatic-release.rpm
if [ ! -d "/var/lib/mysql" ]; then
echo "... Installing MySQL for mariadb Server ..."
sudo yum install mariadb mariadb-server -y
sudo systemctl enable mariadb
sudo systemctl start mariadb
sudo systemctl status mariadb
sudo mysql -u root -c <adduser.sql
# rpm -qa|grep mariadb
# yum remove mariadb
# rm -rf /etc/my.cnf
# rm -rf /var/lib/mysql/
fi
#sudo systemctl status mariadb
#sudo mysql_secure_installation
#echo "================= db password setting ================="
#echo "INFORM:Enter database root password"
#mysql -u root -p <adduser.sql

echo "================= start firewalldDB ================="
sudo systemctl start firewalld
sudo systemctl status firewalld
#sudo firewall-cmd --new-zone=mysql --permanent
sudo firewall-cmd --zone=public --add-port=3306/tcp --permanent
sudo systemctl restart firewalld
sudo systemctl status firewalld
echo "================= END db.SH $(date +"%r") ================="
echo "================= start redis ================="
sudo yum install redis -y
sudo cp redis.conf /etc/redis.conf
sudo systemctl start firewalld
sudo systemctl status firewalld
#sudo firewall-cmd --new-zone=redis --permanent
sudo firewall-cmd --zone=public --add-port=6379/tcp --permanent
sudo firewall-cmd --reload
sudo systemctl restart firewalld
sudo systemctl status firewalld
sudo systemctl start redis
sudo systemctl enable redis
sudo systemctl enable firewalld 
echo "================= END redis $(date +"%r") ================="