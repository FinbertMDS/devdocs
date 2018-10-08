# Overview
This is our developer docs about Command useful in Ubuntu

## Network
1. What ports are opened 
```bash
sudo netstat -ntlp | grep LISTEN
```

2. Download file from link
```bash
wget url
wget -P directory url
wget -O directory/fileName url
```
