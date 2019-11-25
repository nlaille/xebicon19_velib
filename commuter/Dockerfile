FROM node:8-jessie
MAINTAINER Alexis Kinsella <alexis.kinsella@gmail.com>
# setup container for installation.
RUN mkdir /app
WORKDIR /app
RUN git clone https://github.com/akinsella/commuter.git /app
RUN git checkout s3ForcePathStyle-patch
RUN npm i
RUN npm i -S d3-voronoi d3-contour
RUN npm run prestart
EXPOSE 4000
CMD npm run start