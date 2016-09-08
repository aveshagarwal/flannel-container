FROM fedora

MAINTAINER Avesh Agarwal <avagarwa@redhat.com>

ENV container=docker
ENV FLANNELD_ETCD_ENDPOINTS="http://127.0.0.1:2379"
ENV FLANNELD_ETCD_PREFIX="/atomic.io/network"

LABEL Vendor="Red Hat" \
      BZComponent="flannel-docker" \
      Name="rhel7/flannel" \
      Version="0.5.5" \
      Release="1" \
      Architecture="x86_64" \
      Summary="Flannel is an etcd driven address (most commonly ip addresses)  management agent"

RUN yum-config-manager --enable rhel-7-server-extras-rpms || :
RUN yum --enablerepo=rhel-7-server-extras-rpms -y install flannel
RUN yum clean all

LABEL RUN /usr/bin/docker run -d --privileged --net=host \$OPT1 -v /usr/lib/systemd/system/docker.service.d:/usr/lib/systemd/system/docker.service.d -v /var/run:/var/run --name \$NAME \$IMAGE \$OPT2 \$OPT3

ADD flanneld-run.sh /usr/bin/flanneld-run.sh
ADD flanneld-docker-env.sh /usr/bin/flanneld-docker-env.sh

# System container files
ADD tmpfiles.template service.template manifest.json config.json.template /exports/

CMD ["/usr/bin/flanneld-run.sh"]
