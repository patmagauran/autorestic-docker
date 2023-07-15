FROM alpine:3
 
# Copy cron file to the container
COPY cron /etc/cron.d/cron
 
# Give the permission
RUN chmod 0644 /etc/cron.d/cron
 
# Add the cron job
RUN crontab /etc/cron.d/cron
 
# Link cron log file to stdout
RUN ln -s /dev/stdout /var/log/cron

COPY entrypoint.sh /app/entrypoint.sh

RUN chmod 0555 /app/entrypoint.sh

RUN apk add --no-cache bash wget bzip2

RUN wget -qO - https://raw.githubusercontent.com/cupcakearmy/autorestic/master/install.sh | bash
# Run the cron service in the foreground
CMD [ "/bin/bash", "-c", "/app/entrypoint.sh" ]