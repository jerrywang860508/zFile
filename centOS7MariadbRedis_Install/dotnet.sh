sudo rpm -Uvh https://packages.microsoft.com/config/rhel/7/packages-microsoft-prod.rpm
sudo yum update -y
sudo yum install -y dotnet-sdk-2.2
sudo yum install ntp -y
sudo timedatectl set-timezone Asia/Taipei
sudo ntpdate time.stdtime.gov.tw
