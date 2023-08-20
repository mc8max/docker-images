sudo docker build -t spark-base -f base.Dockerfile .
sudo docker build -t spark-master -f master.Dockerfile .
sudo docker build -t spark-worker -f worker.Dockerfile .
sudo docker build -t jupyter-lab -f jupyterlab.Dockerfile .