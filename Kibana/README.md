# Kibana

Kibana can be installed with a package manager by adding Elastic’s package source list.

Create the Kibana source list:

```

echo "deb http://packages.elastic.co/kibana/4.5/debian stable main" | sudo tee -a /etc/apt/sources.list.d/kibana-4.5.x.list
```

Update your apt package database:

```

apt-get update
```

Install Kibana with this command:

```

echo "deb http://packages.elastic.co/kibana/4.5/debian stable main" | sudo tee -a /etc/apt/sources.list.d/kibana-4.5.x.list
```

Kibana is now installed.
    sudo update-rc.d kibana defaults 96 9
    sudo service kibana start

Open the Kibana configuration file for editing:

```

     vi /opt/kibana/config/kibana.yml
```

In the Kibana configuration file, find the line that specifies server.host, and replace the IP address (“0.0.0.0” by default) with “localhost”:

Save and exit. This setting makes it so Kibana will only be accessible to the localhost. This is fine because we will use an Nginx reverse proxy to allow external access.

Now enable the Kibana service, and start it:

```

     update-rc.d kibana defaults 96 9
     service kibana start
```
