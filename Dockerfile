FROM ubuntu
WORKDIR /workdir
RUN apt update
RUN apt upgrade -y
RUN apt install curl -y
RUN curl -sL https://deb.nodesource.com/setup_12.x | bash
RUN apt install nodejs
RUN npm i -g @vue/cli
RUN apt install openssh-server -y
RUN useradd server
RUN echo 'server:vjsserverpass' | chpasswd
RUN chown server /workdir
RUN mkdir /home/server
RUN chown server /home/server
RUN chmod +x run.sh
RUN chmod +x start.sh
COPY . .
EXPOSE 22
EXPOSE 8000
EXPOSE 8080
CMD [ "./run.sh" ]