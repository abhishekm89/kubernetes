# Creating EBS Volume for MySQL DB Instance
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

# Labeling WorkerNodes
kubeclt get nodes
kubectl describe node i-0647a5d1137fde9d6 | grep us-east
kubectl label node i-0647a5d1137fde9d6 zone=us-east-1a
kubectl label node i-0162a4689c5193d71 zone=us-east-1b

