# PodBuilderImage

This project facilitates the creation of a Pod and a Service within a Kubernetes cluster. The Service exposes a "Hello World" web page running in the Pod, which consists of two containers: the "Hello World" container and the "builder" container.

- The "Hello World" container hosts a web server capable of displaying a "Hello World" webpage.
- The "builder" container dynamically builds the image of the "Hello World" container on the fly. This implies that after the creation of the "builder" container, it can download Docker files from the internet and construct an image for the "Hello World" container. There is no need to push the image to a registry; instead, the containerd runtime of the node where the "builder" container resides can retrieve and use the image directly.

## Prerequisites

- Kubernetes Cluster (I utilized [Kind](https://kind.sigs.k8s.io/))

## Issue Breakdown

| Step | Description                                                                         | Path                   |
| ---- | ----------------------------------------------------------------------------------- | ---------------------- |
| 1    | Incorporate an initContainer to:                                                    | [builder/](./builder/) |
|      | - a. Download the Dockerfile from the internet.                                     |                        |
|      | - b. Build a Docker image from the downloaded Dockerfile.                           |                        |
|      | - c. Save the Docker image within the node, enabling the node cluster to access it. |                        |
| 2    | Create a simple webpage Pod + Service + Ingress.                                    | [webpage/](./webpage/) |
| 3    | Develop a Helm chart.                                                               | [helm/](./helm/)       |

**NOTE**:

```bash
# Login to Docker
docker login ghcr.io --username hedeesaa

# Docker Build on MacOS
docker build --no-cache --platform linux/amd64 . -t ghcr.io/hedeesaa/kubescenarios/kaniko:latest

# Package a chart directory into a chart archive
helm package helm/

# Install local helm chart
helm install podbuilerimage ./podbuilderimage-0.1.0.tgz
```

## TODO

- [*] Implement a Github action to upload to the builder.
- [ ] Implement a Github action to build Helm charts.
- [ ] Edit Dockerfile to be more customizable.
