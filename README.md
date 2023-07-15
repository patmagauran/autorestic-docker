# autorestic-docker
This is a docker image that will run autorestic on a cron schedule. 

Just Configure your autorestic file like normal and run this container.

# Config
The only config for this image is the autorestic file(which must be mounted to /app/autorestic), and the following enviornment variable:
  - BACKUP_ON_START - Whether to execute a backup command on container startup
# Example:

## Docker-compose
```{yaml}
version: "3.9"

services:
  backup:
    build: $DOCKERDIR/autorestic-docker
    hostname: docker
    restart: unless-stopped
    environment:
      BACKUP_ON_START: "true"
    volumes:
      - /home/pjm/testData:/mnt/data:ro
      - $DOCKERDIR/appdata/autorestic/autorestic.yml:/app/autorestic.yml
```