FROM alpine:3.4
RUN apk add --no-cache tftp-hpa
VOLUME /var/tftpboot
WORKDIR /var/tftpboot
RUN mkdir -p log
RUN mkdir -p Log
RUN mkdir -p DiagnosticLogs
RUN mkdir -p processedLogs
RUN chmod -R 777 /var/tftpboot
EXPOSE 69/udp
ENTRYPOINT ["in.tftpd"]
CMD ["-L","--verbose", "--create", "--permissive", "--secure", "/var/tftpboot"]

