# LogixWebTrendDocker

Read from a Logix PLC via a web GUI.


![GUI](https://github.com/Destination2Unknown/LogixWebTrendDocker/assets/92536730/7f85e06e-174f-4ee3-bb2b-6afb20c72ed1)


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
