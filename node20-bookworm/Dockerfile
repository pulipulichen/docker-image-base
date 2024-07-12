FROM node:20.15.1-bookworm
RUN apt-get update

ENV LC_ALL=C.UTF-8
ENV LC_LAGNlo=C.UTF-8

RUN apt-get install -y locales
RUN locale-gen C.UTF-8
RUN echo "export LANG=C.UTF-8"
RUN localedef -c -f

CMD "bash"
