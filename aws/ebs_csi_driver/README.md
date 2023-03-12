# Deploy EBS CSI Driver to EKS cluster

## What is EBS ?

>Amazon Elastic Block Store (EBS) is commonly used with Amazon Elastic Kubernetes Service (EKS) on AWS.

>EBS provides block-level storage volumes for use with EC2 instances, 
while EKS is a fully managed Kubernetes service. EKS can use EBS volumes to store persistent data for applications running on Kubernetes clusters.

>When deploying applications on EKS, you can configure Kubernetes to dynamically provision EBS volumes when needed, and attach them to pods running your application. This allows your applications to store and retrieve data from a persistent volume, even if the underlying EC2 instance is terminated.

>In summary, EBS is a valuable tool for storing persistent data in Kubernetes clusters on AWS, and is often used in conjunction with EKS to provide scalable, resilient storage for applications.

---
## Pre-Installation
1. Successfully deployed EKS cluster on AWS.
2. OIDC provider for the your EKS cluster.

#### Why EKS cluster ?
> As we are going to use EBS in conjunction with EKS.

#### Why OIDC provider for your EKS cluster ?
> To enable authentication between Kubernetes and AWS services(EBS).

---
## How to use this module?
```
module "ebs_csi_driver" { 
    source = "github.com/craxkumar/terraform_modules/aws/ebs_csi_driver" 
    cluster-name = "your_cluster_name" 
    region = "EKS_cluster_deployed_region" 
}
```
Note:-

1. module name can be anything, but name it as "ebs_csi_driver" so it would be easier to understand what the module is meant for.
2. source should be same as "github.com/craxkumar/terraform_modules/aws/ebs_csi_driver".
3. cluster name, mention your defined EKS cluster name in which you want to add ebs_csi driver.
4. region, mention region in which the EKS cluster id deployed.
---
#### Below is a reference on how to use ebs_csi driver module

![alt text](https://i.imgur.com/l9WttoY.png)