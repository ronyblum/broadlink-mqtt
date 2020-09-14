FROM debian:stretch

RUN apt-get update && apt-get install -y\
    build-essential libssl-dev libffi-dev python-dev git python-pip

RUN git clone https://github.com/ronyblum/broadlink-mqtt

WORKDIR /broadlink-mqtt

RUN pip install -r /broadlink-mqtt/requirements.txt


ENV MQTT_SERVER=localhost
ENV MQTT_PORT=1883
ENV MQTT_USER=mqtt_user
ENV MQTT_PASS=password
ENV MQTT_TOPIC_PREFIX=broadlink/
ENV DEVICE_HOST=192.168.1.50
ENV DEVICE_MAC=01:23:45:67:ab:00
ENV MQTT_CACERTFILE=/config/certs/rootCA.pem
ENV MQTT_CERTFILE=/config/certs/broadlink/cert.crt
ENV MQTT_KEYFILE=/config/certs/broadlink/private.key


CMD ["python", "/broadlink-mqtt/mqtt.py"]

