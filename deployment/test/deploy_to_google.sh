#!/bin/bash
set -e

date=$(date "+%Y%m%d%H%M")
cluster_name="codeship-gcloud-test-${date}"
echo "Authenticating"
ls
codeship_google authenticate

echo "Starting a small cluster with a single instance"
gcloud config set compute/zone us-central1-a
gcloud container clusters create "${cluster_name}" \
  --num-nodes 1 \
  --machine-type g1-small
