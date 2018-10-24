# Overview
This is our developer docs about [How to install NodeJs](https://nodejs.org/en/download/package-manager/#debian-and-ubuntu-based-linux-distributions):

- Install NodeJs
```bash
wget -qO- https://deb.nodesource.com/setup_8.x | sudo -E bash -
sudo apt-get install -y nodejs
```
- Install Yarn
```bash
curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt-get update && sudo apt-get install yarn
```
