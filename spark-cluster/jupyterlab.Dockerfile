FROM spark-base

# -- Layer: JupyterLab

ARG spark_version=3.4.1
ARG jupyterlab_version=3.5.0

RUN apt-get update -y 
RUN apt install libffi-dev
RUN apt-get install -y python3-pip 
RUN pip3 install wget 
RUN pip3 install pyspark==${spark_version} 
RUN pip3 install jupyterlab==${jupyterlab_version}

# -- Runtime

EXPOSE 9999

ARG SHARED_WORKSPACE=/opt/workspace
WORKDIR ${SHARED_WORKSPACE}
CMD jupyter lab --ip=0.0.0.0 --port=9999 --no-browser --allow-root --NotebookApp.token=