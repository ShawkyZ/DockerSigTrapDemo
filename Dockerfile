FROM ubuntu:22.04
RUN apt-get update && apt install docker.io -y

COPY . /app

WORKDIR /app
ENTRYPOINT ["./spawn-container.sh"]