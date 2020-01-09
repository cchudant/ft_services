FROM nginx
MAINTAINER Charles Chudant (cchudant@student.42.fr)

RUN apt-get update && \
    apt-get install -y openssh-server

COPY entrypoint /entrypoint

ENTRYPOINT bash /entrypoint

EXPOSE 443 80
