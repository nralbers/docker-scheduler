# nralbers/scheduler
This is a simple scheduler container that extends the standard Alpine linux schedule folders and automatically starts the crond when instantiated.

# Usage
To give this container something to run, you simply bind mount whatever script you want to run into the /etc/periodic folder for the run interval you need. The script must have the following properties:

1. executable bit set with `chmod a+x`
2. No extension

The container has the following interval directories with cron schedules to match:

- `/etc/periodic/1min`
- `/etc/periodic/5min`
- `/etc/periodic/15min`
- `/etc/periodic/hourly`
- `/etc/periodic/daily`
- `/etc/periodic/weekly`
- `/etc/periodic/monthly`

The image has the following extra utilities installed on top of the base alpine image:

- bash
- bind-utils
- curl
- git
- openssh
- rsync

# Example 

`docker-compose.yml`
```yaml
---
version: '3.7'

services:
  scheduler:
    image: nralbers/scheduler
    volumes:
    - ./test.sh:/etc/periodic/1min/test
```
