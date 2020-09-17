#!/bin/sh

podman run --name fasrc --rm -it \
	-v ssh:/etc/ssh \
	-v $PWD/config:/config \
	--privileged \
	-p 127.0.0.1:2222:22 \
	--init \
	fasrc
