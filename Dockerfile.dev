FROM python:3.8-buster

ENV DEBIAN_FRONTEND noninteractive

COPY notebook_helper/packages_setup.bash /
RUN /packages_setup.bash

COPY notebook_helper/base_requirements.txt /
RUN pip install -r /base_requirements.txt

COPY requirements.txt /
RUN pip install -r /requirements.txt