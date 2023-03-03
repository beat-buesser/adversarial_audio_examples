FROM jupyter/base-notebook:python-3.9.7

USER root
RUN apt-get update \
 && apt-get install  -yq --no-install-recommends \
    libfontconfig1 \
    libxrender1 \
    libosmesa6 \
    ffmpeg \
    libavcodec-extra \
    git \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# install the notebook package
RUN pip install --no-cache --upgrade pip && \
    pip install --no-cache notebook jupyterlab

USER ${NB_USER}
ENV HOME /home/${NB_USER}
WORKDIR ${HOME}

RUN git clone https://github.com/beat-buesser/adversarial_audio_examples.git

WORKDIR ${HOME}/adversarial_audio_examples
RUN pip install -r requirements.txt
