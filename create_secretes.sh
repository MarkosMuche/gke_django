#!/bin/bash

# Export environment variables from .env file
export $(grep -v '^#' .env | xargs)

# Create Kubernetes secret
kubectl create secret generic cloudsql \
  --from-literal=database="$POSTGRES_DB" \
  --from-literal=username="$POSTGRES_USER" \
  --from-literal=password="$POSTGRES_PASS" \
  --from-literal=host="$POSTGRES_HOST" \
  --from-literal=port="$POSTGRES_PORT"
