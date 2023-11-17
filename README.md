# LogixWebTrendDocker

Read from a Logix PLC via a web GUI.
---

## Run using docker-compose

```yaml
version: '3'
services:
  logixwebtrenddocker:
    image: ghcr.io/destination2unknown/logixwebtrenddocker:main
    container_name: logixwebtrend
    ports:
      - 5000:5000
    volumes:
      - /etc/localtime:/etc/localtime:ro
    restart: unless-stopped
```
