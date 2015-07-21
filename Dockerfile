FROM ubuntu:latest
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
RUN echo "deb http://download.mono-project.com/repo/debian wheezy main" > /etc/apt/sources.list.d/mono-xamarin.list
RUN apt-get update
RUN apt-get install -y mono-complete
RUN apt-get install -y wget unzip
RUN apt-get clean
RUN rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/*

WORKDIR /root

RUN wget http://www.pecastation.org/files/PeerCastStation-1.9.2.zip
RUN unzip PeerCastStation-1.9.2.zip

ENV MONO_NO_SMP=1
ENV MONO_ENABLE_SHM=1

CMD ["mono", "/root/PeerCastStation-1.9.2/PeerCastStation.exe"]
