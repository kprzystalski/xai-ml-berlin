FROM ubuntu:18.04

RUN apt-get update

RUN apt-get -y install \
	python3-pip \
	git \
	vim \
        unzip \
	graphviz

RUN pip3 install --upgrade pip

RUN pip3 install eli5 \
	 jupyter \
	 xai \
	 aix360 \
	 shap \
 	 lime \
	 matplotlib \
	 seaborn \
	 graphviz \
	 pandas-profiling \
         tensorboard \
	 jupyter-tensorboard \
         opencv-python \
	 skater
	 
EXPOSE 8888

RUN useradd -ms /bin/bash codete
RUN adduser codete sudo
RUN jupyter-tensorboard enable --system


USER codete
WORKDIR /home/codete/
RUN mkdir /home/codete/workshop/
RUN mkdir /home/codete/workshop/tensorboard/
RUN mkdir /home/codete/workshop/tensorboard/logs/

RUN tensorboard --logdir /home/codete/workshop/tensorboard/logs/ &

CMD jupyter-notebook --ip=0.0.0.0 --NotebookApp.token='' --NotebookApp.password='' --no-browser --notebook-dir=/home/codete/workshop/
