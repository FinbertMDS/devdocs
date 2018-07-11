# Overview
This is our developer docs about How to remote to server Ubuntu

## Info server
- SSH
```text
IP: 54.83.169.163
Port: 2213
Username: ubuntu
```
- Private key:

Create file **server.pem** with info about private key
```text
-----BEGIN RSA PRIVATE KEY-----
MIIEpAIBAAKCAQEA0GTRLEQ25wcudoa+NKaOG3dKV955ZhjeI/YhU1IFKc7fOM16
koXTWPtVE8D09VVkjfWxgQavP8eqcocIEWxNt3uSeFzn0zvUfTL1PeXlx9I3qwOB
m/NqdGdhL/8NQ4L1LPQ5NYxnwlIMz0S76IMDwSBl9NeVv+swPEejEhbMI5/9yEaO
MrtwnADBO73NvxHa8/vh9F54YwNE1rV1yksmrzLygBS0+6z2Jefqom6zSgdUONlN
77JdPPzLZXzWt7nlNAcNHlymiXWWDY2sQl/mU7P6r7FQgjv9SiFca8zrMlT/rmur
ZAQPmkiEZeXfHZg5qoML/CLr/wLBNyJ4pOROkwIDAQABAoIBACSLmZceu1YWj1Jf
3NlU4BT2/YWdUULTV5mM31lCR/+F9OV8O2OYrnCrWsclDpA7km/Gx4MuDeusczq0
bXjIunRT6mLLQChuFJyEJDffqkU5m2OVMNSNgny5aHTHUKcnPyHMDoBSiBuu0epD
ToS+/RiQOvEOIYfPkdzwXyub7d7NLbEWKOThpLecn6EubH8FhJihUTgzy0Xb3kHQ
/sIIZToaqVI6iAuIBL1t+UNuwBTQsItUsxjFQZMeqCjmgLmZy95ggLlbpQhZJJmx
Fk4bQcMKGfkhJUy3iwZ4ZGxLbpSPjiS5IGs1QyzuII6/93UKSgYQUkUHtAdog4Qu
/x7Nv4ECgYEA+RuzIrM2aFsBXBJ2mLATib1ylTFMstGM6HEf4UjCKIW5BijSFL4j
M90hC0+CUfhWVviTdvwLbGry8pfsFviGZQuNHTFlCe8dGUybrqw/kQe5P7ICg7zK
M/zE/lCCjUvu6J1fOK9rMgw0iTFEiS4iQnmJxqK5FuTLsr2mVyuKLlMCgYEA1ijC
VI32utg2DR1h5jJ57TKSysd1Cc1xuaq3787pv0UqdfocpFZlHIfAxqg2Ow+yhKgn
wniZrgLWKfsaFEapojvvlqcg8cIaAjnKf4JEa7LBtSZgI6q3+pKrZk+BRqr9aCld
xNLlv4wLWabi6DBrLu+zs09vYKB+2USG8wlK1sECgYEA8sG1rmkq6kNVbd5oSJ++
SoqeMRnb/p8LTDGBuc9ntomqJ4B8Sc6JC6/A1f7jpvH1YcfYHSm+ECehHhxC7JfA
kJPTLtHF/wpQNylaxbwCLllyg8n7fVnrSwJXDuZyczO+XF2QP/Ni6WDPiarDeVPF
+zXpt/M3oEHS6Bq9EVHS1RUCgYAjAsLSQ+skHJipiDYrBfF835mz4Ou3UIjZC5nK
cI8yH8KTSvJHw4AALAlN8M381dIfccYeOs0U743Hiy92RR8SUK4YePYfz9Wkq4H5
WniJCs40KTPqYMx3AGdY8IJ35RhMYQbdWIUKzYBFhczunIvJPpKoK8JPj61tI5DU
Rp6fgQKBgQClAX0rMilvfb7Zi9nrHPc862VndUrepClRw/x/BewqppshWII8qyfv
nc4tbbeURr/W88zUWZ5fTGYf972UJqOQ5CI0XJFIYr8V7NnNmz9UdCixLgPQQidC
7JJY4Y72PjbCwA9DJUNwhyxX2pdFjjJqvGrSukP12cTx0WLiIpDFXw==
-----END RSA PRIVATE KEY-----
```

- Putty key

Create file **server.ppk** with info about Putty Key:
```text
PuTTY-User-Key-File-2: ssh-rsa
Encryption: none
Comment: imported-openssh-key
Public-Lines: 6
AAAAB3NzaC1yc2EAAAADAQABAAABAQDQZNEsRDbnBy52hr40po4bd0pX3nlmGN4j
9iFTUgUpzt84zXqShdNY+1UTwPT1VWSN9bGBBq8/x6pyhwgRbE23e5J4XOfTO9R9
MvU95eXH0jerA4Gb82p0Z2Ev/w1DgvUs9Dk1jGfCUgzPRLvogwPBIGX015W/6zA8
R6MSFswjn/3IRo4yu3CcAME7vc2/Edrz++H0XnhjA0TWtXXKSyavMvKAFLT7rPYl
5+qibrNKB1Q42U3vsl08/MtlfNa3ueU0Bw0eXKaJdZYNjaxCX+ZTs/qvsVCCO/1K
IVxrzOsyVP+ua6tkBA+aSIRl5d8dmDmqgwv8Iuv/AsE3Inik5E6T
Private-Lines: 14
AAABACSLmZceu1YWj1Jf3NlU4BT2/YWdUULTV5mM31lCR/+F9OV8O2OYrnCrWscl
DpA7km/Gx4MuDeusczq0bXjIunRT6mLLQChuFJyEJDffqkU5m2OVMNSNgny5aHTH
UKcnPyHMDoBSiBuu0epDToS+/RiQOvEOIYfPkdzwXyub7d7NLbEWKOThpLecn6Eu
bH8FhJihUTgzy0Xb3kHQ/sIIZToaqVI6iAuIBL1t+UNuwBTQsItUsxjFQZMeqCjm
gLmZy95ggLlbpQhZJJmxFk4bQcMKGfkhJUy3iwZ4ZGxLbpSPjiS5IGs1QyzuII6/
93UKSgYQUkUHtAdog4Qu/x7Nv4EAAACBAPkbsyKzNmhbAVwSdpiwE4m9cpUxTLLR
jOhxH+FIwiiFuQYo0hS+IzPdIQtPglH4Vlb4k3b8C2xq8vKX7Bb4hmULjR0xZQnv
HRlMm66sP5EHuT+yAoO8yjP8xP5Qgo1L7uidXzivazIMNIkxRIkuIkJ5icaiuRbk
y7K9plcrii5TAAAAgQDWKMJUjfa62DYNHWHmMnntMpLKx3UJzXG5qrfvzum/RSp1
+hykVmUch8DGqDY7D7KEqCfCeJmuAtYp+xoURqmiO++WpyDxwhoCOcp/gkRrssG1
JmAjqrf6kqtmT4FGqv1oKV3E0uW/jAtZpuLoMGsu77OzT29goH7ZRIbzCUrWwQAA
AIEApQF9KzIpb32+2YvZ6xz3POtlZ3VK3qQpUcP8fwXsKqabIViCPKsn753OLW23
lEa/1vPM1FmeX0xmH/e9lCajkOQiNFyRSGK/FezZzZs/VHQosS4D0EInQuySWOGO
9j42wsAPQyVDcIcsV9qXRY4yarxq0rpD9dnE8dFi4iKQxV8=
Private-MAC: d619c293fe0ac660bff38d6c8db7d73736a51826
```
[Server Info](https://docs.google.com/spreadsheets/d/1xN_hfrPmq4OXfR6_LpYkIwM9-3QUWJf7pZlcFPuA1O8/edit#gid=949537507)
## SSH to server
### Use Putty
1. Install Putty
    - On Windows: https://www.sitecuatui.com/tao-ssh-key-bang-puttygen/
    - On Ubuntu: https://websiteforstudents.com/installing-putty-on-ubuntu-16-04-17-10-18-04/
2. Create file server.ppk with info about Putty Key
3. Fill info about server
    - Host name or Ip
    - Port
    - Connection > SSH > Auth then press Browse… to file server.ppk 
### Use command line on Ubuntu
1. Install SSH
    - https://help.ubuntu.com/lts/serverguide/openssh-server.html.en
2. Create file **server.pem** with info about Private key
3. Connect to server by command
```bash
ssh -i server.pem ubuntu@demo-omc1.magestore.com -p 2213
```