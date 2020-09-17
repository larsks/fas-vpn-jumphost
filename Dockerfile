FROM fedora:32

RUN yum -y install \
	openconnect \
	tcpdump \
	openssh-clients \
	openssh-server \
	iputils \
	iproute

RUN useradd -c 'VPN User' vpn

ENV VPNSERVER=vpn.rc.fas.harvard.edu

COPY start.sh /start.sh

CMD ["bash", "/start.sh"]
