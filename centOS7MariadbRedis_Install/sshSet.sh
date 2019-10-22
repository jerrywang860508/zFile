#ssh-keygen -R 192.168.0.114 清除登入記錄異常
sudo firewall-cmd --zone=public --add-port=22/tcp --permanent
sudo firewall-cmd --reload
sudo systemctl restart firewalld
sudo systemctl start sshd.service
#sudo ssh-keygen -y
sudo cp /home/vagrant/sshd_config /etc/ssh/sshd_config
sudo systemctl enable sshd
sudo systemctl restart sshd.service
