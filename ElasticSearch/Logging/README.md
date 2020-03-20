# ElasticSearch

Elasticsearch is a flexible and powerful open-source, distributed real-time search and analytics engine. Using a simple set of APIs, it provides the ability for full-text search. Elastic search is freely available under the Apache 2 license, which provides the most flexibility.


### Installing ElasticSearch

#### Step 1 – Prerequsities

Elasticsearch required Java to run on any system. Make sure your system has Java installed by running following command. This command will show you the current Java version

``` 

java -version
```

#### Step 2 – Install Elasticsearch on Ubuntu

The Elasticsearch official team provides an apt repository to install Elasticsearch on Ubuntu Linux system. After install below package and import GPG key for Elasticsearch packages.

``` 

apt-get install apt-transport-https
wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -
```

Then configure the apt repository on your Debian system. The below command will add a repository to install latest Elasticsearch 6.X on your Ubuntu system.

``` 

add-apt-repository "deb https://artifacts.elastic.co/packages/7.x/apt stable main"
```

After adding the repository to your system. Run the following commands to update cache and then install Elasticsearch packages on your system.

``` 

apt-get update
apt-get install elasticsearch
```

#### Step 3 – Configure Elasticsearch

The Elasticsearch has been installed on your system. You can customize this by editing the Elasticsearch configuration file. Edit configuration file in your favorite text editor and update it:

``` 

nano /etc/elasticsearch/elasticsearch.yml
```

Change the following values:

``` 

 network.host: 0.0.0.0
 cluster.name: myCluster1
 node.name: "myNode1"
```

#### Step 4 – Launch Elasticsearch

Elasticsearch can be started and stopped as follows:

``` 

service elasticsearch start                                                                                                                                             service elasticsearch stop

```



