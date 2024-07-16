FROM pytorch/pytorch:1.10.0-cuda11.3-cudnn8-runtime
# FROM ubuntu

RUN apt update && apt install -y git

## probably doesn't work to add the built files to the host directory
## dues to the following stupid rule
## https://docs.docker.com/reference/dockerfile/#notes-about-specifying-volumes
# VOLUME /app

RUN git clone https://github.com/kindredbluespirit/momask-codes.git /setup

# WORKDIR /app
WORKDIR /setup

# RUN --mount=type=bind,source=.,target=. 
RUN pwd && ls && \
    pip install -r requirements.txt \
    && bash prepare/download_models.sh