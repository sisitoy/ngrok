#Download ngrok
wget -q -c -nc https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip
unzip -qq -n ngrok-stable-linux-amd64.zip

#Create tunnel
./ngrok authtoken 1qq2xfUQluoYsKhHeSFoutkOP4c_7escTPaiB6jXGNKHRGqmJ && ./ngrok tcp 22

#Setup sshd
sudo apt-get install openssh-server

# if install fail run this, uncomment and run the below line
sudo apt-get install openssh-server --fix-missing

#Set root password
echo root:oncom | chpasswd
mkdir -p /var/run/sshd
echo "PermitRootLogin yes" >> /etc/ssh/sshd_config
echo "PasswordAuthentication yes" >> /etc/ssh/sshd_config
echo "LD_LIBRARY_PATH=/usr/lib64-nvidia" >> /root/.bashrc
echo "export LD_LIBRARY_PATH" >> /root/.bashrc

get_ipython().system_raw('/usr/sbin/sshd -D &')
# to check if ssh is running on port 22 or not or installed or not
sudo apt install net-tools
netstat -plant | grep ssh
which sshd

/usr/bin/sshd 
tcp        0      0 0.0.0.0:22              0.0.0.0:*               LISTEN 1008/sshd

# get_ipython().system_raw('./ngrok authtoken $authtoken && ./ngrok tcp 22 &')
with urllib.request.urlopen('http://localhost:4040/api/tunnels') as response:
  data = json.loads(response.read().decode())
  (host, port) = data['tunnels'][0]['public_url'][6:].split(':')
  print(f'SSH command: ssh -p{port} root@{host}')
#Print root password
print(f'SSH password: {password}')
