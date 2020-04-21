ARG BUILD_FROM
FROM $BUILD_FROM

ENV LANG C.UTF-8

# Install requirements for add-on
ENV CONFIG_PATH=/data/options.json
ENV APPDIR=/opt/MySensors

RUN chmod a+x /run.sh && \ 
    apk update && apk add --no-cache \
    make \
    g++ \
    git \
    #&& rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* ~/.cache \
    && git clone https://github.com/mysensors/MySensors.git --branch master $APPDIR

# Copy data for add-on
COPY run.sh /
RUN chmod a+x /run.sh

CMD [ "/run.sh" ]