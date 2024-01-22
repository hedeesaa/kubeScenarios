#!/bin/bash

git clone https://github.com/hedeesaa/kubeScenarios.git
# Run Kaniko
/kaniko/executor --dockerfile /kubeScenarios/podBuilderImage/webpage/Dockerfile --context dir:///kubeScenarios/podBuilderImage/webpage/ --destination ghcr.io/hedeesaa/kubescenarios/webpage --no-push --tar-path webpage.tar

# Import the image using Containerd
ctr -n k8s.io --address /run/containerd/containerd.sock image import webpage.tar