#!/bin/bash

set -o errexit
set -o nounset
set -o pipefail

# Download k3d
curl -s https://raw.githubusercontent.com/rancher/k3d/master/install.sh | bash

# Create a cluster
k3d create

# export kubeconfig
sleep 5
export KUBECONFIG="$(k3d get-kubeconfig --name='k3s-default')"

