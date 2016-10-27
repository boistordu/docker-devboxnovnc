FROM phusion/baseimage:0.9.18

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]

ENV IDEA_VERSION=2016.1.4
ENV MAVEN_VERSION=3.3.9
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US
RUN locale-gen en_US.UTF-8

#peut-être nécessaire si xubuntu ne complète pas automatiquement
#COPY configs/idea.desktop /usr/share/applications/idea.desktop
#COPY configs/idea.png /opt/idea/idea.png


RUN add-apt-repository ppa:x2go/stable
RUN DEBIAN_FRONTEND=noninteractive apt-get update \
 && DEBIAN_FRONTEND=noninteractive apt-get upgrade -y -o Dpkg::Options::="--force-confold" \
&& DEBIAN_FRONTEND=noninteractive apt-get dist-upgrade -y -o Dpkg::Options::="--force-confold"

RUN DEBIAN_FRONTEND=noninteractive apt-get update \
&& DEBIAN_FRONTEND=noninteractive apt-get install -y xubuntu-desktop

COPY ./startup.sh /usr/bin/startup.sh
#installation des paquets nécessaires
RUN DEBIAN_FRONTEND=noninteractive apt-get update && apt-get install -y \
	nano \
    lshw \
    gettext \
    gedit \
    gnome-terminal \
#    aptitude \
    byobu \
    build-essential \
    curl \
    git \
    htop \
    libasound2 \
    libdbus-glib-1-2 \
    libgtk2.0-0 \
    libpango1.0-0 \
    libxt6 \
    libXrender1 \
#    lxde \
    openjdk-7-jdk \
    openssh-server \
    software-properties-common \
#    sudo \
    vim \
	wget \
	x11vnc \
	python \
	python-numpy \
	unzip \
	Xvfb \
	firefox \
	openbox \
	geany \
	menu \
	apache2 \
 && apt-get clean \
&& apt-get -y autoremove
ADD passvnc /root/passvnc
RUN cd /root && git clone https://github.com/kanaka/noVNC.git && \
	cd noVNC/utils && git clone https://github.com/kanaka/websockify websockify && \
	cd /root && \
	chmod 0755 /usr/bin/startup.sh 

RUN echo -e "\n\n\n* * *  Cleaning up  * * * \n\n"
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*


CMD /usr/bin/startup.sh
EXPOSE 6080
