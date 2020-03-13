

# Fluentd - Syslog integration


Fluentd is an open source data collector, which lets you unify the data collection and consumption for a better use and understanding of data.

Syslog is a standard for message logging. It allows separation of the software that generates messages, the system that stores them, and the software that reports and analyzes them. Each message is labeled with a facility code, indicating the software type generating the message, and assigned a severity level. 

### Installing fluentd on Kubernetes cluster

#### Prerequisites 
Kubectl with kubeconfig pointing to the target cluster


Apply the yaml files in the following order

``` 
kubectl apply -f flent-service-account.yaml
kubectl apply -f flent-cluster-role.yaml
kubectl apply -f flent-cluster-role-binding.yaml
kubectl apply -f fluentd-daemonset-syslog.yaml
```

Check if fluentd is running 

```
kubectl get pods
```


### Installing syslog server on Linux system 

### Prerequisites
A linux instance with 2GB memory and 4GB free disk space for log files

Add steps here 



