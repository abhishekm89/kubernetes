# Creating EBS Volume for MySQL DB Instance:
aws ec2 create-volume --availability-zone=us-east-1a --size=3 --volume-type=gp2
# output:
{
    "AvailabilityZone": "us-east-1a",
    "CreateTime": "2023-08-09T08:00:28.000Z",
    "Encrypted": false,
    "Size": 3,
    "SnapshotId": "",
    "State": "creating",
    "VolumeId": "vol-0e8758ca1b8288234",
    "Iops": 100,
    "Tags": [],
    "VolumeType": "gp2",
    "MultiAttachEnabled": false
}

# Edit Tags on Volume (vol-0e8758ca1b8288234) via CLI/ManagementConsole
Key: KubernetesCluster
Value: kops.abhishekmagaji.in

# Labeling WorkerNodes:
kubeclt get nodes
kubectl describe node i-0647a5d1137fde9d6 | grep us-east-1
kubectl label node i-0647a5d1137fde9d6 zone=us-east-1a
kubectl label node i-0162a4689c5193d71 zone=us-east-1b

# Deployment on Clusters:
kubectl create -f app-secret.yml
kubectl create -f db-deploy.yml
kubectl create -f db-clusterIP.yml
kubectl create -f memcached-deploy.yml
kubectl create -f memcached-clusterIP.yml
kubectl create -f rabbitmq-deploy.yml
kubectl create -f rabbitmq-clusterIP.yml
kubectl create -f app-deploy.yml
kubectl create -f app-loadBalancer.yml


