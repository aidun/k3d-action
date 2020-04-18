#!/bin/bash

set -o errexit
set -o nounset
set -o pipefail

# Download k3d
curl -s https://raw.githubusercontent.com/rancher/k3d/master/install.sh | bash

# Download kubectl
curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/darwin/amd64/kubectl
chmod +x ./kubectl
sudo mv kubectl /usr/local/bin/

# Download helm
curl https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 | bash

# Create a cluster
k3d create

# export kubeconfig
export KUBECONFIG="$(k3d get-kubeconfig --name='k3s-default')"

