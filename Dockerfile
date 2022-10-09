FROM jupyter/scipy-notebook
LABEL author="Willian M. Serenone"
LABEL version=0.0.1
LABEL name="HEPAnalysis"

RUN mamba install -y uproot hist mplhep jupyter_http_over_ws">=0.0.7"
RUN jupyter serverextension enable --py jupyter_http_over_ws


CMD jupyter notebook --NotebookApp.allow_origin='https://colab.research.google.com' --port=8888 --NotebookApp.port_retries=0
