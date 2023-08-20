# builder step used to download and configure spark environment
FROM openjdk:11.0.11-jre-slim-buster as builder

ARG SHARED_WORKSPACE=/opt/workspace

# Add Dependencies for PySpark
RUN apt-get update && apt-get install -y curl vim wget software-properties-common ssh net-tools ca-certificates python3 python3-pip python3-numpy python3-matplotlib python3-scipy python3-pandas python3-simpy

RUN update-alternatives --install "/usr/bin/python" "python" "$(which python3)" 1

# Install Spark
RUN wget --no-verbose -O apache-spark.tgz "https://dlcdn.apache.org/spark/spark-3.4.1/spark-3.4.1-bin-hadoop3.tgz" \
&& mkdir -p /opt/spark \
&& tar -xf apache-spark.tgz -C /opt/spark --strip-components=1 \
&& rm apache-spark.tgz


ENV SPARK_VERSION=3.4.1
ENV SPARK_HOME=/opt/spark
ENV SPARK_MASTER_HOST spark-master
ENV SPARK_MASTER_PORT 7077
ENV PYSPARK_PYTHON python3

RUN mkdir ${SHARED_WORKSPACE}

WORKDIR ${SPARK_HOME}