FROM ghcr.io/choss/temurin-with-gcloud-sdk:11-jre-jammy-gcloud-448

RUN mkdir -p /opt/flink && cd /opt/flink && wget -nv -O flink.tgz 'https://www.apache.org/dyn/closer.cgi?action=download&filename=flink/flink-1.15.4/flink-1.15.4-bin-scala_2.12.tgz' && tar -xf flink.tgz --strip-components=1 --owner=0 --group=0 && rm flink.tgz && mkdir -p /opt/k8s && cd /opt/k8s && curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" && chmod +x kubectl && cd /opt && wget -nv -O gke-auth-plugin.tar.gz https://dl.google.com/dl/cloudsdk/release/downloads/for_packagers/linux/google-cloud-cli-gke-gcloud-auth-plugin_448.0.0.orig_amd64.tar.gz  && tar -xf gke-auth-plugin.tar.gz && rm -f gke-auth-plugin.tar.gz && rm -f /root/.wget-hsts

ENV PATH=/opt/k8s:/opt/google-cloud-sdk/bin:/opt/java/openjdk/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
ENTRYPOINT ["/__cacert_entrypoint.sh"]
