FROM ghcr.io/choss/temurin-with-gcloud-sdk-and-flink:main

RUN mkdir -p /opt/apache-hop/ && cd /opt/apache-hop && wget -nv -O apache-hop.zip 'https://www.apache.org/dyn/closer.cgi?filename=hop/2.7.0/apache-hop-client-2.7.0.zip&action=download' \
    && apt-get update && apt-get install -y unzip && apt-get clean \
    && ln -s . hop && unzip apache-hop.zip && rm hop && rm apache-hop.zip

ENV PATH=/opt/k8s:/opt/google-cloud-sdk/bin:/opt/java/openjdk/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
ENTRYPOINT ["/__cacert_entrypoint.sh"]