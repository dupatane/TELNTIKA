Security:
1. Show how to block ports
using iptable utility--->sudo ufw deny <port-number> or u can remove respective port range rules from inbound of ec2 security group 
2. Show how to setup port forwarding
ssh -i vscode.pem -L 8000:localhost:8080 ubuntu@43.205.119.185 (windows local host to ec2 )
or defining port range and ip address of local host in security group vice versa.
