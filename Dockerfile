FROM ghcr.io/choss/temurin-with-gcloud-sdk:11-jre-jammy-gcloud-448

RUN mkdir -p /opt/flink && cd /opt/flink && wget -O flink.tgz 'https://www.apache.org/dyn/closer.cgi?action=download&filename=flink/flink-1.15.4/flink-1.15.4-bin-scala_2.12.tgz' && tar -xf flink.tgz --strip-components=1 && rm flink.tgz && curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"

ENTRYPOINT ["/__cacert_entrypoint.sh"]
