FROM python:3.8-buster

ENV DEBIAN_FRONTEND noninteractive

RUN pip install --no-cache-dir notebook

COPY notebook_helper/packages_setup.bash /
RUN chmod u+x /packages_setup.bash
RUN /packages_setup.bash

COPY notebook_helper/base_requirements.txt /
RUN pip install -r /base_requirements.txt

COPY requirements.txt /
RUN pip install -r /requirements.txt

ARG NB_USER=jovyan
ARG NB_UID=1000
ENV USER ${NB_USER}
ENV NB_UID ${NB_UID}
ENV HOME /home/${NB_USER}

RUN adduser --disabled-password \
    --gecos "Default user" \
    --uid ${NB_UID} \
    ${NB_USER}

COPY . ${HOME}
USER root
RUN chown -R ${NB_UID} ${HOME}
USER ${NB_USER}