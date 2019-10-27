#!/bin/bash

sudo apt install python3-rtree

# Install gmaps for jupyter notebooks
# With pip: https://jupyter-gmaps.readthedocs.io/en/latest/install.html#installing-jupyter-gmaps-with-pip
pip install jupyterlab

pip install -r requirements.txt
jupyter nbextension enable --py --sys-prefix widgetsnbextension
jupyter nbextension enable --py --sys-prefix gmaps
jupyter labextension install @jupyter-widgets/jupyterlab-manager

jupyter nbextension install --py --sys-prefix keplergl
jupyter nbextension enable --py --sys-prefix keplergl
jupyter nbextension enable --py --sys-prefix widgetsnbextension
jupyter labextension install @jupyter-widgets/jupyterlab-manager keplergl-jupyter

jupyter lab build
echo "Jupyter version: $(jupyter notebook --version)"
