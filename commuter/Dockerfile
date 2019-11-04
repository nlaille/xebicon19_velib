FROM node:latest
MAINTAINER Alexis Kinsella <alexis.kinsella@gmail.com>
# setup container for installation.
RUN mkdir /app
WORKDIR /app
RUN git clone https://github.com/nteract/commuter.git /app
RUN npm i
RUN npm i -S d3-voronoi
RUN npm run build
EXPOSE 4000
CMD npm run start