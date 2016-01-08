FROM ubuntu:latest
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
RUN echo "deb http://download.mono-project.com/repo/debian wheezy main" > /etc/apt/sources.list.d/mono-xamarin.list
RUN apt-get update
RUN apt-get install -y libmono-system-configuration4.0-cil libmono-system-core4.0-cil libmono-system-data-linq4.0-cil libmono-system-numerics4.0-cil libmono-system-runtime-serialization4.0-cil libmono-system-xml-linq4.0-cil libmono-system-xml4.0-cil libmono-i18n-cjk4.0-cil
RUN apt-get install -y wget unzip
RUN apt-get clean
RUN rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/*

WORKDIR /root

RUN wget http://www.pecastation.org/files/PeerCastStation-2.1.2.zip
RUN unzip PeerCastStation-2.1.2.zip
RUN rm /root/PeerCastStation-2.1.2/PeerCastStation.GUI.dll /root/PeerCastStation-2.1.2/PeerCastStation.WPF.dll

ENV MONO_NO_SMP=1
ENV MONO_ENABLE_SHM=1

CMD ["mono", "/root/PeerCastStation-2.1.2/PeerCastStation.exe"]
