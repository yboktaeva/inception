
FROM debian:buster

RUN apt update && apt upgrade --yes && apt install sudo locales --yes
RUN sudo apt update
RUN sudo apt install nginx -y

# COPY

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]