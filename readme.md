# Getting Started

### NodeJS

The default apt-get NodeJS package is an older version (0.6.x). Joyent has documented a
way to get the most recent stable version here:  

https://github.com/joyent/node/wiki/Installing-Node.js-via-package-manager#ubuntu-mint-elementary-os

Before following the guide, it's useful to get rid of the built-in `node` package if it
has been installed:

```
sudo apt-get --purge remove node
```

### Express

This application is built on top of Express. To work with it properly you'll need to install
the express package globally:

```
sudo npm install -g express
```
