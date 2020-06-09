FROM ubuntu:16.04

RUN apt-get update && apt-get install -y git build-essential cmake
RUN git clone git://github.com/pnorman/ogr2osm.git && cd ogr2osm && git submodule update --init
RUN apt-get install -y libxml2-utils python python-gdal 

ENV commit="0046dd08c3ed2ec7c176fdb44c922962fe6c8ecc"
RUN git clone https://github.com/navit-gps/navit.git 
RUN cd navit && git checkout ${commit} && mkdir bin && cd bin && cmake ../ \
	&& make maptool

