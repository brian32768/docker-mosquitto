This is left over from testing to create a "presence" service
that is actually just built in to the Unifi integration in Home Assistant


FROM python:latest

RUN pip install paho-mqtt

COPY presence-unifi.py /srv

WORKDIR /srv

#CMD ["python", "presence-unifi.py", "/unifi/log/server.log"]

# docker build -t . presence
# docker run -it --rm -v unifi_log:/unifi/log:ro presence
