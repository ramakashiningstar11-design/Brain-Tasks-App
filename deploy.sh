#!/bin/bash
set -e

# Set variables
REGION=ap-south-1
CLUSTER_NAME=akash-eks-cluster
DEPLOY_DIR=/home/ec2-user/deploy

# Update kubeconfig for EKS
aws eks update-kubeconfig --region $REGION --name $CLUSTER_NAME

# Apply Kubernetes manifests
kubectl apply -f $DEPLOY_DIR/deployment.yaml
kubectl apply -f $DEPLOY_DIR/service.yaml

echo "Deployment to EKS completed successfully!"

