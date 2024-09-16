# Requirements:
- Terraform
- Kubectl
- GCloud SDK
- GCP Service Account & JSON key
- gke-gcloud-auth-plugin

# Deployment:

## Step 1 - export application credentials
```
export GOOGLE_APPLICATION_CREDENTIALS="/path/to/key.json"
```

## Step 2 - Apply Terraform
```
terraform init --upgrade
terraform plan -out=tfplan
terraform apply "tfplan"
```

## Step 3 - Check GKE cluster
```
gcloud container clusters list
```

## Step 4 - Configure kubectl to use your GKE cluster
```
gcloud container clusters get-credentials CLUSTER_NAME --zone ZONE --project PROJECT_ID
```

## Step 5 - Deploy Application
```
kubectl apply -f deployment.yaml
kubectl apply -f service.yaml
```

## Step 6 - Verify Deployment
```
kubectl get deployments
kubectl get services
```
