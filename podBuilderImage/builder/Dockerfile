#################################
#### Crictl                  ####
#################################
FROM alpine:3.19.0

ENV VERSION="v1.26.0"
ENV RUNTIME_ENDPOINT="/run/containerd/containerd.sock"

RUN wget https://github.com/kubernetes-sigs/cri-tools/releases/download/$VERSION/crictl-$VERSION-linux-amd64.tar.gz

RUN tar zxvf crictl-$VERSION-linux-amd64.tar.gz -C /usr/local/bin

CMD ["crictl","--runtime-endpoint=$RUNTIME_ENDPOINT"]
