This project provides the following:

1 - Docker build of an application using GitHub Actions

2 - Hosting of docker image on GitHub Container Registry

3 - Deployment of application from GCR Image on GKE Cluster using Terraform

4 - VPC restrict access to application from specified IP's

# Requirements:
- Terraform
- Kubectl
- GCloud SDK
- GCP Service Account & JSON key
- gke-gcloud-auth-plugin

# Setup:

## Step 1 - Config:

Update your Project ID `project_id` and IP's to deny `deny_ip_ranges_ipv4` in the `/terraform/terraform.tfvars` file.

## Step 2 - Export your application credentials:
```
export GOOGLE_APPLICATION_CREDENTIALS="/path/to/key.json"
```

# Deployment:

## Step 1 - Apply Terraform from `/terraform` directory:
```
terraform init --upgrade
terraform plan -out=tfplan
terraform apply "tfplan"
```

## Step 2 - Check GKE cluster:
```
gcloud container clusters list
```

## Step 3 - Configure kubectl to use your GKE cluster:
```
gcloud container clusters get-credentials CLUSTER_NAME --zone ZONE --project PROJECT_ID
```

## Step 4 - Deploy Application from `/kubernetes` directory:
```
kubectl apply -f deployment.yaml
kubectl apply -f service.yaml
```

## Step 5 - Verify Deployment
```
kubectl get deployments
kubectl get services
```
After you list services on the line of the `express` app you should see your `EXTERNAL-IP` to be able to access the app.

## Step 6 - Destroy deployment from `/terraform` directory:
```
terraform plan -out=tfplan --destroy
terraform apply "tfplan"
```
