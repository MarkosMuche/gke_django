# Setting Up GKE for Django App

This is a very simple implementation of deploying a django application on GKE. I think this one is perfect to learn to do it.

This guide will walk you through setting up a Google Kubernetes Engine (GKE) cluster for a Django application.

## 1. Create a GKE Cluster

Follow the [Google Cloud Platform (GCP) documentation](https://cloud.google.com/kubernetes-engine/docs/how-to/creating-a-cluster) for creating a GKE cluster.

## 2. Create a Cloud SQL Instance

Create a Cloud SQL instance along with the necessary user and database. Refer to the [GCP documentation](https://cloud.google.com/sql/docs/mysql/create-instance) for detailed instructions.

## 3. Create an Artifacts Registry

Create an Artifacts Registry. You will need the registry later in your `.env` file under `DOCKER_TAG`.

## 4. Clone the Repository

Clone the repository from GitHub:

```
git clone git@github.com:MarkosMuche/gke_django.git
```

## 5. Configure Environment Variables

Remove the `.sample` extension from `.env.sample` and populate the values:

```
POSTGRES_PASS=
POSTGRES_HOST=
POSTGRES_USER=
POSTGRES_PORT=5432
POSTGRES_DB=
DOCKER_TAG=
```

## 6. Build and Push Docker Image

Run the following script to build and push the Docker image:

```
bash build_and_push.sh
```

## 7. Create Kubernetes Secrets

Run the following script to create Kubernetes secrets:

```
bash create_secrets.sh
```

## 8. Deploy the Application

Deploy the application by running:

```
kubectl create -f app.yaml
```

That's it! Your Django application should now be up and running on GKE.
