#!/bin/bash
REGIONS="us-east-2  us-west-1"


check_for_error() {

	status=$1
	msg=$2

	if [[ ${status} -ne 0 ]]; then
		echo $msg
	fi
	return 0	
}

for each in $REGIONS; 
do
	export AWS_DEFAULT_REGION=${each}
        volumes=$(mktemp)	
       	aws ec2 describe-volumes --output text --query 'Volumes[*].[VolumeId,Attachments[0].InstanceId,State]'  >  ${volumes}
	check_for_error $? -e "\e[1;33m Failed in listing volumes for region ${each} \e[0m"
	while read line
	do
        	echo $line
        	volumeID=$(echo $line | awk '{print $1}')
        	attachment=$(echo $line | awk '{print $2}')
        	state=$(echo $line | awk '{print $3}')
        	if [ $state == "available" ]
        	then
			echo -e "\e[1;31m deleting volume of volumeID $volumeID \e[0m"
                	aws ec2 delete-volume --volume-id $volumeID
        	fi
	done < ${volumes}
        instancestxt=$(mktemp)
 	aws ec2 describe-instances --query 'Reservations[*].Instances[*].[InstanceId]' --output text > ${instancestxt}
	check_for_error $? "Failed in listing Instances for region ${each}"
	while read line1
	do
		echo $line1
		instanceid=$(echo $line1 | awk '{print $1}')
		instances1txt=$(mktemp)
       	 	aws ec2 describe-instances --instance-ids $instanceid  --query 'Reservations[*].Instances[*].[Tags]' --output text > ${instances1txt}
		check_for_error $? "InstanceID $instanceid  not found in region ${each}"
       	 	while read line2
		do
	     		name=$(echo $line2 | awk '{print $1}')
             		value=$(echo $line2 | awk '{print $2}')
			echo $instanceid
	     		if [ $name == "delete" ]
             		then
				echo -e "\e[1;31m Deleting instance of instanceid $instanceid in region ${each}  \e[0m"
		     		aws ec2 terminate-instances --instance-id $instanceid
	     		fi
	  	done < ${instances1txt}
	done < ${instancestxt}
	lb1=$(mktemp)
	aws elb describe-load-balancers --query 'LoadBalancerDescriptions[*].[LoadBalancerName,Instances[0].InstanceId]' --output text > ${lb1}
	check_for_error $? "Load balancers nt found in region ${each}"
	while read line3
	do
		echo $line3
                name1=$(echo $line3 | awk '{print $1}')      
                Lbid=$(echo $line3 | awk '{print $2}')
                if [ $Lbid == "None" ]
	        then
	                aws elb delete-load-balancer --load-balancer-name $name1
	        fi		
	done < ${lb1}
	lb2=$(mktemp)
	aws elbv2 describe-load-balancers --query 'LoadBalancers[*].[LoadBalancerName,LoadBalancerArn]'  --output text > ${lb2}
	check_for_error $? "Load balancers nt found in region ${each}"
	while read line4
        do
		echo $line4
		lbname=$(echo $line4 | awk '{print $1}')
		arn=$(echo $line4 | awk '{print $2}')
		echo -e "\e[1;31m Deleting load balancer $lbname in region ${each}  \e[0m"
		lb3=$(mktemp)
		aws elbv2 describe-tags  --resource-arns $arn --query 'TagDescriptions[*].[Tags[*]]' --output text  > ${lb3}
		while read line5
		do 
		     key=$(echo $line5 | awk '{print $1}')
		     value=$(echo $line5 | awk '{print $2}')
		     if [ $key == "delete" ]
	             then
			     echo -e "\e[1;31m Deleting load balancer $lbname in region ${each}  \e[0m"
			     aws elbv2 delete-load-balancer --load-balancer-name $lbname
	             fi
		done < ${lb3}
       done < ${lb2}

done 



