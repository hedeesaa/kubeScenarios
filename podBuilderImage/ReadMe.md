# PodBuilerImage

Create a Pod and a Service in the Kubernetes cluster.
The Service can expose a “Hello World” web page running in the Pod. And in the Pod, there are 2 containers. “Hello World” container and “builder” container.

- The “Hello World” container is running a web server and can display a “Hello World” webpage.
- The “builder” container can build the image of the “Hello World” container on the fly. That
  means after the “builder” container is created, it can download Docker files from Internet and build an image for the “Hello World” container. You don’t have to push the image to a registry. The containerd runtime of the node where the “builder” container is running can retrieve and use the image directly.

## Prerequisite

- Kubernetes Cluster (I used [Kind](https://kind.sigs.k8s.io/))

## Breakdown the issue

1. An initContainer to  
   a. download dockerfile from internet  
   b. build docker image from that dockerfile  
   c. save the docker image inside the node so that node cluster can have access to it.

   ```
   # login to docker
   docker login ghcr.io --username hedeesaa
   ```

2. An simple webpage pod + service + ingress
3. Helm chart

# TODO:

1. Github action to upload to builder
2. Github action to build helm
