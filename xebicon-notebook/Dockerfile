FROM jupyter/scipy-notebook:1386e2046833

COPY requirements.txt /tmp/requirements.txt

RUN pip install -r /tmp/requirements.txt
# Install geopandas from conda
RUN pip uninstall -y geopandas && conda install geopandas

# Enable extensions

COPY jupyter_notebook_config.py /etc/jupyter/jupyter_notebook_config.py
