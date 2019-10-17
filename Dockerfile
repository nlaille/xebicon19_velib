FROM jupyter/scipy-notebook:1386e2046833

RUN pip install nteract_on_jupyter gmaps bookstore
RUN jupyter nbextension enable --py gmaps
RUN jupyter serverextension enable --py bookstore