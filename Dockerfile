# nralbers/scheduler: runs a crond to schedule tasks.
# Copyright (C) 2019 Niels Albers (nralbers@gmail.com)
#
#    This program is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with this program.  If not, see <https://www.gnu.org/licenses/>.
FROM alpine:latest
LABEL maintainer="nralbers@gmail.com"
LABEL version="1.0"
LABEL description="Image running crond with additional schedule options for /etc/periodic/1min and /etc/periodic/5min. \
The image has bash, bind-tools, git & openssh installed. To use: bind mount the scripts you want to schedule to /etc/periodic/<period>"
RUN apk update && apk add bash bind-tools openssh git curl rsync
RUN mkdir -p /etc/periodic/1min && echo "*       *       *       *       *       run-parts /etc/periodic/1min" >> /etc/crontabs/root
RUN mkdir -p /etc/periodic/5min && echo "*/5     *       *       *       *       run-parts /etc/periodic/5min" >> /etc/crontabs/root
ENTRYPOINT ["crond", "-f", "-d", "8"]
