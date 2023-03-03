FROM python:3.9-slim
# install the notebook package
RUN pip install --no-cache --upgrade pip && \
    pip install --no-cache notebook jupyterlab

# install ffmpeg
RUN apt-get update -y
RUN apt-get -y install ffmpeg libavcodec-extra vim git

ENV HOME=/tmp
