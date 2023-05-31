Network:
1. Show list of processes using the network.
netstat -tulnp
2. Show the list of IPs a process is connected to
lsof -p <pid> -i 
3. Show how to list open files and kill processes tied to a user
lsof -u ubuntu | killall -u ubuntu
