#################################
#### Crictl                  ####
#################################
FROM gcr.io/kaniko-project/executor:debug AS kaniko
FROM alpine:3.14.2

RUN apk --update add jq libcap containerd git
COPY --from=kaniko /kaniko/ /kaniko/

ENV PATH $PATH:/usr/local/bin:/kaniko
ENV DOCKER_CONFIG /kaniko/.docker/
ENV DOCKER_CREDENTIAL_GCR_CONFIG /kaniko/.config/gcloud/docker_credential_gcr_config.json
ENV SSL_CERT_DIR /kaniko/ssl/certs

####
RUN git clone https://github.com/hedeesaa/kubeScenarios.git
###
ENTRYPOINT ["/kaniko/executor --dockerfile /kubeScenarios/podBuilderImage/webpage/Dockerfile --destination ghcr.io/hedeesaa/kubescenarios/webpage --no-push --tar-path webpage.tar && ctr -n k8s.io --address /run/containerd/containerd.sock image import webpage.tar"]
# ENTRYPOINT ["/kaniko/executor"]



# FROM alpine:3.19.0

# ENV VERSION="v1.26.0"
# ENV RUNTIME_ENDPOINT="/run/containerd/containerd.sock"

# RUN apk add git
# RUN wget https://github.com/kubernetes-sigs/cri-tools/releases/download/$VERSION/crictl-$VERSION-linux-amd64.tar.gz

# RUN tar zxvf crictl-$VERSION-linux-amd64.tar.gz -C /usr/local/bin

# CMD ["crictl","--runtime-endpoint=$RUNTIME_ENDPOINT"]
