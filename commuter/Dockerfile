FROM node:latest
MAINTAINER Alexis Kinsella <alexis.kinsella@gmail.com>

# setup container for installation.
RUN npm install @nteract/commuter -g --unsafe-perm

EXPOSE 4000

ENTRYPOINT commuter