# Creating an IAM OIDC provider for your EKS cluster

## What is IAM OIDC provider ?

> An IAM OIDC provider is a mechanism that allows you to use AWS Identity and Access Management (IAM) to manage access to your Kubernetes cluster using OIDC. 

>When you create an OIDC provider for your EKS cluster, AWS creates an endpoint that Kubernetes can use to verify and authenticate user and service accounts through IAM. This endpoint is known as an IAM OIDC provider.

>Using an IAM OIDC provider for EKS clusters is a recommended practice as it provides a secure and manageable way to control access to your cluster. It eliminates the need to create and manage Kubernetes-specific RBAC (role-based access control) policies, and also provides the ability to audit access to your cluster using IAM's logging and monitoring features.

> An OpenID Connect (OIDC) issuer URL associated with a cluster means that the cluster has been configured to use OIDC as an authentication mechanism.

## Why do we need this IAM OIDC provider ?

>IAM OIDC is used for authentication of users and services to access AWS resources that EKS (or any other AWS service) wants to use.

>When you use OIDC with EKS, you're essentially allowing Kubernetes to use an external identity provider (IdP) to authenticate user and service accounts for access to AWS resources, including the EKS cluster itself, as well as any other AWS resources that your cluster needs to interact with, such as EBS volumes, S3 buckets, and more.

>The OIDC provider allows Kubernetes to obtain a secure, short-lived AWS IAM role that represents the Kubernetes service account, which has the necessary permissions to access the desired AWS resources. This IAM role is used to authenticate and authorize Kubernetes requests to AWS APIs, without requiring the use of long-term AWS access keys or IAM user accounts.

>By using OIDC with EKS, you can provide a centralized way to manage access to AWS resources, while also leveraging Kubernetes-native authentication and authorization mechanisms to provide fine-grained control over who can access your cluster and what they can do with it.






---
## Pre-Installation
1. Successfully deployed EKS cluster on AWS.

#### Why EKS cluster ?
> As we are going to create IAM OIDC provider for your EKS cluster.

---
## How to use this module?
```
module "eks_oidc_provider" { 
    source = "github.com/craxkumar/terraform_modules/aws/eks_oidc_provider" 
    cluster-name = "your_cluster_name" 
    region = "EKS_cluster_deployed_region" 
}
```
Note:-

1. module name can be anything, but name it as "eks_oidc_provider" so it would be easier to understand what the module is meant for.
2. source should be same as "github.com/craxkumar/terraform_modules/aws/eks_oidc_provider".
3. cluster name, mention your defined EKS cluster name for which you want to create IAM OIDC provider.
4. region, mention region in which the EKS cluster is deployed.
---
#### Below is a reference on how to use eks_oidc_provider module

![alt text](https://i.imgur.com/FWTqjFR.png)