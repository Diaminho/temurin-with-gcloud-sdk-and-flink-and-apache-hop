FROM ghcr.io/choss/temurin-with-gcloud-sdk-and-flink:main

RUN mkdir -p /opt/apache-hop/ && cd /opt/apache-hop && wget -nv -O apache-hop.zip 'https://archive.apache.org/dist/hop/2.4.0/apache-hop-client-2.4.0.zip' \
    && apt-get update && apt-get install -y unzip && apt-get clean \
    && ln -s . hop && unzip apache-hop.zip && rm hop && rm apache-hop.zip \
	&& mkdir /opt/apache-hop/BQ_JDBC \
	&& cd /opt/apache-hop/BQ_JDBC \ 
	&& wget -nv -O bq-jdbc-driver.zip https://storage.googleapis.com/simba-bq-release/jdbc/SimbaJDBCDriverforGoogleBigQuery42_1.5.2.1005.zip \
	&& unzip bq-jdbc-driver.zip \
	&& mv *.jar /opt/apache-hop/lib/core/ \
	&& rm -rf /opt/apache-hop/BQ_JDBC

ENV PATH=/opt/k8s:/opt/google-cloud-sdk/bin:/opt/java/openjdk/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
ENTRYPOINT ["/__cacert_entrypoint.sh"]
