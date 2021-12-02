#!/bin/bash

apt update -y\
&& apt install -y python3-pip python3-pandas python3-sklearn wget;

pip3 install chainer tensorflow pandas-ml opencv-python jupyterlab;

cd \
&& wget https://packages.vmware.com/bitfusion/ubuntu/20.04/bitfusion-client-ubuntu2004_4.0.0-13_amd64.deb \
&& apt install -y ./bitfusion-client-ubuntu2004_4.0.0-13_amd64.deb;

jupyter notebook --generate-config\
&& echo "c.NotebookApp.ip = '0.0.0.0'" >> ~/.jupyter/jupyter_notebook_config.py;

cd ~/tmp/share/jupyter/kernels/
mv python3/ bitfusion-basic
cat ~/Bitfusion_JupyterLab/kernel.json > ./bitfusion-basic/kernel.json
jupyter kernelspec install --user ~/tmp/share/jupyter/kernels/bitfusion-basic/

jupyter-lab --allow-root