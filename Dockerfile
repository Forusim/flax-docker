FROM ubuntu:latest

ARG DEBIAN_FRONTEND="noninteractive"
ARG BRANCH="latest"

EXPOSE 6888

ENV keys="generate"
ENV harvester="false"
ENV farmer="false"
ENV plots_dir="/plots"
ENV farmer_address="null"
ENV farmer_port="null"
ENV testnet="false"
ENV full_node_port="null"
ENV TZ="UTC"

RUN apt-get update \
 && apt-get install -y tzdata ca-certificates git lsb-release sudo nano

RUN git clone --branch ${BRANCH} https://github.com/Flax-Network/flax-blockchain.git --recurse-submodules \
 && cd flax-blockchain \
 && chmod +x install.sh && ./install.sh \
 && . ./activate && chia init

ENV PATH=/flax-blockchain/venv/bin/:$PATH
WORKDIR /flax-blockchain

VOLUME /config

COPY ./entrypoint.sh entrypoint.sh
ENTRYPOINT ["bash", "./entrypoint.sh"]
