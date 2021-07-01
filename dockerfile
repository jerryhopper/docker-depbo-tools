#
#

FROM ubuntu:bionic
RUN ls -latr /home

ARG APP_VERSION=0
RUN ARCH="$(dpkg --print-architecture)"; \
    case "${ARCH}" in\
    aarch64|arm64)\
        BINARY_URL='https://github.com/jerryhopper/docker-depbo-tools/raw/master/external/mikero-tools-linux-arm64.tar.gz';\
        ;;\
    amd64|x86_64)\
        BINARY_URL='https://github.com/jerryhopper/docker-depbo-tools/raw/master/external/depbo-tools-0.8.10-linux-64bit.tgz';\
        ;;\
    *)\
        echo "Unsupported arch: ${ARCH}";\
        exit 1;\
        ;;\
    esac \
    && apt update \
    && apt install -y curl unzip liblzo2-2 libvorbis0a libvorbisfile3 libvorbisenc2 libogg0 libuchardet0 \
    && curl -LfsSo /tmp/pbotools.tar.gz ${BINARY_URL} \
    && ls -latr /tmp \
    && cd /tmp \
    && tar zxv pbotools.tar.gz \
    && ls -latr /tmp 
#    && mkdir -p /usr/local/pbotools \
#&& ls -latr /usr/local/pbotools 
#    && tar zxv /tmp/pbotools.tar.gz
#&& apt install -y liblzo2-2 libvorbis0a libvorbisfile3 libvorbisenc2 libogg0 libuchardet0 curl unzip
#\
#    && curl -LfsSo /tmp/pbotools.tar.gz ${BINARY_URL} \
#    && mkdir -p /usr/local/pbotools && tar -zxv /tmp/pbotools.tar.gz -C /usr/local/pbotools


RUN echo $BINARY_URL
#RUN ls -latr /usr/local/pbotools 
#RUN tar -zxv $BINARY_URL -C /usr/local/pbotools

###### Use Ubuntu latest and only copy in what we need to reduce the layer size ###################
#FROM ubuntu:bionic
#COPY --from=build /usr/local/pbotools /usr/local/pbotools

###### Start #######################################################################
LABEL description="..."
LABEL maintainer="<hopper.jerry@gmail.com>"
ENV PATH=$PATH:/usr/local/pbotools/bin
ENV LD_LIBRARY_PATH=/usr/local/pbotools/lib


#CMD ["/usr/local/fusionauth/fusionauth-app/apache-tomcat/bin/catalina.sh", "run"]
