#!/bin/bash

# Install gmaps for jupyter notebooks
# With pip: https://jupyter-gmaps.readthedocs.io/en/latest/install.html#installing-jupyter-gmaps-with-pip
pip install jupyterlab
jupyter nbextension enable --py --sys-prefix widgetsnbextension
pip install -r requirements.txt
jupyter nbextension enable --py --sys-prefix gmaps
jupyter labextension install @jupyter-widgets/jupyterlab-manager
jupyter lab build
echo "Jupyter version: $(jupyter notebook --version)"
