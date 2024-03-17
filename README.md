# Setting Up Django Application on GKE

This guide provides a straightforward approach to deploying a Django application on Google Kubernetes Engine (GKE). It's designed to be simple and educational.

## 1. Create an Autopilot GKE Cluster

Follow the [Google Cloud Platform (GCP) documentation](https://cloud.google.com/kubernetes-engine/docs/how-to/creating-an-autopilot-cluster) for creating an Autopilot GKE cluster.

## 2. Set Up Cloud SQL Instance

Create a Cloud SQL instance along with the necessary user and database. Detailed instructions can be found in the [GCP documentation](https://cloud.google.com/sql/docs/postgres/create-instance).

## 3. Configure Artifacts Registry

Refer to the [GCP documentation](https://cloud.google.com/artifact-registry/docs/repositories/create-repos) to create an Artifacts Registry. You will need this registry later in your `.env` file under `DOCKER_TAG`.

## 4. Clone the Repository

Clone the repository from GitHub:

```
git clone git@github.com:MarkosMuche/gke_django.git
```

## 5. Configure Environment Variables

Remove the `.sample` extension from `.env.sample` and populate the values:

```
POSTGRES_PASS= <your_cloudsql_password>
POSTGRES_HOST= <your_cloudsql_public_ip>
POSTGRES_USER= <your_cloudsql_user>
POSTGRES_PORT=5432
POSTGRES_DB= <your_cloudsql_database_name>
DOCKER_TAG= <path_to_your_artifacts_registry>/<your_image_name>:<your_tag>
```

## 6. Build and Push Docker Image

Execute the script to build and push the Docker image:

```
bash build_and_push.sh
```

## 7. Create Kubernetes Secrets

Run the script to create Kubernetes secrets:

```
bash create_secrets.sh
```

## 8. Deploy the Application

Deploy the application by running:

```
kubectl create -f app.yaml
```

That's it! Your Django application is now deployed and running on GKE.
