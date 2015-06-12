FROM ubuntu:14.04
MAINTAINER github/iznobe

RUN apt-get update && apt-get install -y mesa-utils

# install nvidia driver
RUN apt-get install -y binutils
ADD NVIDIA-DRIVER.run /tmp/NVIDIA-DRIVER.run
RUN sh /tmp/NVIDIA-DRIVER.run -a -N --ui=none --no-kernel-module
RUN rm /tmp/NVIDIA-DRIVER.run

# install KODI ( xbmc )    xbmc-standalone
RUN apt-get install -y xbmc

### Clean
RUN apt-get -y upgrade && apt-get -y autoclean && apt-get -y clean && apt-get -y autoremove

CMD /usr/bin/xbmc


