FROM flink:1.19.1-java11

# Download Paimon Flink connector and S3 support
RUN wget -q -P /opt/flink/lib/ \
    https://repo1.maven.org/maven2/org/apache/paimon/paimon-flink-1.19/1.3.1/paimon-flink-1.19-1.3.1.jar && \
    wget -q -P /opt/flink/lib/ \
    https://repo1.maven.org/maven2/org/apache/paimon/paimon-flink-action/1.3.1/paimon-flink-action-1.3.1.jar && \
    wget -q -P /opt/flink/lib/ \
    https://repo1.maven.org/maven2/org/apache/paimon/paimon-s3/1.3.1/paimon-s3-1.3.1.jar && \
    wget -q -P /opt/flink/lib/ \
    https://repo1.maven.org/maven2/org/apache/flink/flink-shaded-hadoop-2-uber/2.8.3-10.0/flink-shaded-hadoop-2-uber-2.8.3-10.0.jar && \
    wget -q -P /opt/flink/lib/ \
    https://repo1.maven.org/maven2/org/apache/flink/flink-sql-connector-mysql-cdc/3.4.0/flink-sql-connector-mysql-cdc-3.4.0.jar && \
    wget -q -P /opt/flink/lib/ \
    https://repo1.maven.org/maven2/com/mysql/mysql-connector-j/8.0.33/mysql-connector-j-8.0.33.jar
