 #Setup Elasticsearch on Ubuntu 18.04 & 16.04 LTS/
 #Step 1 – Prerequsities/
 Elasticsearch required Java to run on any system. Make sure your system has Java installed by running following command. This command will show you the current Java version./
 $ java -version/
 #Step 2 – Install Elasticsearch on Ubuntu/
 $sudo apt-get install apt-traThe Elasticsearch official team provides an apt repository to install Elasticsearch on Ubuntu Linux system. After install below package and import GPG key for Elasticsearch packages.nsport-https/
 $wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add /
 Then configure the apt repository on your Debian system. The below command will add a repository to install latest Elasticsearch 6.X on your Ubuntu system./
 $add-apt-repository "deb https://artifacts.elastic.co/packages/7.x/apt stable main"/
 After adding the repository to your system. Run the following commands to update cache and then install Elasticsearch packages on your system./
$sudo apt-get update/
$sudo apt-get install elasticsearch/
#Step 3 – Configure Elasticsearch/
Go to  /etc/elasticsearch/elasticsearch.yml/
Change the following values/
network.host: 0.0.0.0/
 cluster.name: myCluster1/
 node.name: "myNode1"/
 #Step 4 – Launch Elasticsearch/
 service elasticsearch start/
 service elasticsearch status
