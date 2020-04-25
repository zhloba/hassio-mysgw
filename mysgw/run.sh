#!/usr/bin/with-contenv bash

echo "MySensors Gateway"
MYSGW_TYPE="$(jq --raw-output '.type' $CONFIG_PATH)"
MYSGW_TRN="$(jq --raw-output '.transport' $CONFIG_PATH)"
MQTT_SERVER="$(jq --raw-output '.mqtt_server' $CONFIG_PATH)"
MQTT_CLIENTID="$(jq --raw-output '.mqtt_clientid' $CONFIG_PATH)"
MQTT_TOPIC_IN="$(jq --raw-output '.mqtt_topicin' $CONFIG_PATH)"
MQTT_TOPIC_OUT="$(jq --raw-output '.mqtt_topicout' $CONFIG_PATH)"

MQTT_OPTS="--my-mqtt-client-id=$MQTT_CLIENTID --my-controller-url-address=$MQTT_SERVER --my-mqtt-publish-topic-prefix=$MQTT_TOPIC_OUT --my-mqtt-subscribe-topic-prefix=$MQTT_TOPIC_IN"

cd $APPDIR
./configure --spi-spidev-device=/dev/spidev0.0 --my-transport=$MYSGW_TRN --my-gateway=$MYSGW_TYPE $MQTT_OPTS
make && make install

/usr/local/bin/mysgw