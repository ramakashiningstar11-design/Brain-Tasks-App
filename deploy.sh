#!/bin/bash
set -e

REGION=ap-south-1
CLUSTER_NAME=akash-eks-cluster
DEPLOY_DIR=/home/ec2-user/deploy

echo "Updating kubeconfig..."
aws eks update-kubeconfig --region $REGION --name $CLUSTER_NAME

echo "Applying deployment..."
kubectl apply -f $DEPLOY_DIR/deployment.yaml
kubectl rollout status deployment/brain-tasks-deployment

echo "Applying service..."
kubectl apply -f $DEPLOY_DIR/service.yaml

echo "Deployment to EKS completed successfully!"

