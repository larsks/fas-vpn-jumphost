#!/bin/sh

podman run --name fasrc --rm -it \
	-v ssh:/etc/ssh \
	-v $PWD/dotssh:/home/vpn/.ssh \
	--privileged \
	-p 127.0.0.1:2222:22 \
	--init \
	fasrc
