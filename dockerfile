#
#

FROM ubuntu:bionic
RUN ls -latr /home

ARG APP_VERSION=0
RUN ARCH="$(dpkg --print-architecture)"; \
    case "${ARCH}" in\
    aarch64|arm64)\
        BINARY_URL='./external/mikero-tools-linux-arm64.tar.gz';\
        ;;\
    amd64|x86_64)\
        BINARY_URL='./external/depbo-tools-0.8.10-linux-64bit.tgz';\
        ;;\
    *)\
        echo "Unsupported arch: ${ARCH}";\
        exit 1;\
        ;;\
    esac \
    && apt update \
    && apt install -y liblzo2-2 libvorbis0a libvorbisfile3 libvorbisenc2 libogg0 libuchardet0 
#\    && mkdir -p /usr/local/pbotools && tar -zxv $BINARY_URL -C /usr/local/pbotools

RUN echo $BINARY_URL
#RUN ls -latr 
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
