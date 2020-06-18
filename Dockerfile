FROM jupyter/datascience-notebook

RUN pip install --upgrade pip
RUN pip install jupyterlab RISE
RUN jupyter serverextension enable --py jupyterlab
RUN jupyter-nbextension install rise --py --sys-prefix
RUN jupyter-nbextension enable rise --py --sys-prefix