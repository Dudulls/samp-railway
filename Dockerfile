FROM debian:stable-slim
RUN apt update && apt install -y wget unzip screen lib32gcc-s1

WORKDIR /samp
RUN wget https://github.com/Southclaw/samp-vscode/raw/master/sa-mp/samp03svr_linux.tar.gz && \
    tar zxvf samp03svr_linux.tar.gz && \
    rm samp03svr_linux.tar.gz

COPY server.cfg .

RUN chmod +x samp03svr
EXPOSE 7777/udp
CMD ["sh", "-c", "screen -dmS samp ./samp03svr && tail -f /dev/null"]
