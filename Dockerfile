FROM jupyter/scipy-notebook:1386e2046833

COPY requirements.txt /tmp/requirements.txt

RUN pip install -r /tmp/requirements.txt

# Enable extensions

COPY config/jupyter_notebook_config.py .jupyter/jupyter_notebook_config.py