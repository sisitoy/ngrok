./ngrok start --all --config="/home/runner/.ngrok2/ngrok.yml"
#Set root password
echo root:oncom | chpasswd
mkdir -p /var/run/sshd
echo "PermitRootLogin yes" >> sudo /etc/ssh/sshd_config
echo "PasswordAuthentication yes" >> sudo /etc/ssh/sshd_config
echo "LD_LIBRARY_PATH=/usr/lib64-nvidia" >> sudo /root/.bashrc
echo "export LD_LIBRARY_PATH" >> sudo /root/.bashrc
sudo /usr/sbin/sshd -D
# to check if ssh is running on port 22 or not or installed or not
sudo apt install net-tools
netstat -plant | grep ssh
which sshd
sudo /usr/bin/sshd 
tcp        0      0 0.0.0.0:22              0.0.0.0:*               LISTEN 1008/sshd
