# Vuls

Vuls is an open-source, agentless vulnerability scanner written in Go. It automates security vulnerability analysis of the software installed on a system, which can be a burdensome task for system admiVuls uses SQLite to store their vulnerability informationnistrators to do manually in a production environment. Vuls uses multiple renowned vulnerability databases, such as the National Vulnerability Database (NVD). Light on resources, Vuls has the ability to scan multiple systems at once, and to send reports via email or Slack. It has three scan modes (fast, fast root, and deep), which you can select according to the situation

## Vuls Installation

### Requirements

* A server running Ubuntu 18.04.
* A root password is configure on your system.

### Step 1: update your system with the latest version. You can do this by running the following command:

```
apt-get update -y
```
### Step 2: Vuls uses SQLite to store their vulnerability information.

you will need to install SQLite and other required packages to your system. You can install all of them with the following command:


```
apt-get install sqlite3 git debian-goodies gcc make wget -y
```
Once installed, you will need to download and install the latest version of Go on your system.

```
export GOPATH=$HOME/go
export PATH=$PATH:/usr/local/go/bin
source /etc/profilemkdir /root/go
mkdir -p $GOPATH/src/github.com/kotakanbe

```
### Step 3: Install and Configure Vuls

Next, you will need to download Vuls source and install it to your system. You can download it from the Git repository with the following command:

```
mkdir -p $GOPATH/src/github.com/future-architect
cd $GOPATH/src/github.com/future-architect
git clone https://github.com/future-architect/vuls.git
```
Next, change the directory to vuls and install it with the following command:

```
cd vuls
make install
```
Once installed, you will need to copy vuls binary to the /usr/local/bin directory. You can do it with the following command:

```
cp $GOPATH/bin/vuls /usr/local/bin/
```
Next, you will need to create a vuls configuration file in /usr/share/vuls-data directory:

```
cd /usr/share/vuls-data
 nano config.toml
 
 
 add the following lines
 
 [cveDict]
type = "sqlite3"
SQLite3Path = "/usr/share/vuls-data/cve.sqlite3"

[ovalDict]
type = "sqlite3"
SQLite3Path = "/usr/share/vuls-data/oval.sqlite3"

[servers]

[servers.localhost]
host = "localhost"
port = "local"
scanMode = [ "fast" ]
```

Save and close the file, when you are finished.
Next, test the configuration file with the following command:

```
vuls configtest
```

If everything is fine, you should see the following output:

```
[Sep 17 16:01:39]  INFO [localhost] Validating config...
[Sep 17 16:01:39]  INFO [localhost] Detecting Server/Container OS... 
[Sep 17 16:01:39]  INFO [localhost] Detecting OS of servers... 
[Sep 17 16:01:39]  INFO [localhost] (1/1) Detected: localhost: ubuntu 18.04
[Sep 17 16:01:39]  INFO [localhost] Detecting OS of static containers... 
[Sep 17 16:01:39]  INFO [localhost] Detecting OS of containers... 
[Sep 17 16:01:39]  INFO [localhost] Checking Scan Modes...
[Sep 17 16:01:39]  INFO [localhost] Checking dependencies...
[Sep 17 16:01:39]  INFO [localhost] Dependencies... Pass
[Sep 17 16:01:39]  INFO [localhost] Checking sudo settings...
[Sep 17 16:01:39]  INFO [localhost] sudo ... No need
[Sep 17 16:01:39]  INFO [localhost] It can be scanned with fast scan mode even if warn or err messages are displayed due to lack of dependent packages or sudo settings in fast-root or deep scan mode
[Sep 17 16:01:39]  INFO [localhost] Scannable servers are below...
localhost 
```

## Scan Your System Using Vuls

Vuls is now installed and configured to scan your local system. To scan your local system, run the following command:

```
vuls scan
```
You should see the following output:

```
[Sep 17 16:02:20]  INFO [localhost] Start scanning
[Sep 17 16:02:20]  INFO [localhost] config: /usr/share/vuls-data/config.toml
[Sep 17 16:02:20]  INFO [localhost] Validating config...
[Sep 17 16:02:20]  INFO [localhost] Detecting Server/Container OS... 
[Sep 17 16:02:20]  INFO [localhost] Detecting OS of servers... 
[Sep 17 16:02:20]  INFO [localhost] (1/1) Detected: localhost: ubuntu 18.04
[Sep 17 16:02:20]  INFO [localhost] Detecting OS of static containers... 
[Sep 17 16:02:20]  INFO [localhost] Detecting OS of containers... 
[Sep 17 16:02:20]  INFO [localhost] Checking Scan Modes... 
[Sep 17 16:02:20]  INFO [localhost] Detecting Platforms... 
[Sep 17 16:02:21]  INFO [localhost] (1/1) localhost is running on other
[Sep 17 16:02:21]  INFO [localhost] Detecting IPS identifiers... 
[Sep 17 16:02:21]  INFO [localhost] (1/1) localhost has 0 IPS integration
[Sep 17 16:02:21]  INFO [localhost] Scanning vulnerabilities... 
[Sep 17 16:02:21]  INFO [localhost] Scanning vulnerable OS packages...
[Sep 17 16:02:21]  INFO [localhost] Scanning in fast mode


One Line Summary
================
localhost	ubuntu18.04	537 installed

To view the detail, vuls tui is useful.
To send a report, run vuls report -h.

```
Vuls also store their vulnerabilities report in the log file. You can see it later with the following command:

```
vuls tui
```













