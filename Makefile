#
# Makefile
# kaoru, 2025-05-05 21:08
#

DOCKER_USER=ubuntu

all:


build::
	sudo docker build -t vim-latest-dev .

run::
	sudo docker run -it -v /home/$(USER)/tmp/vimrc:/home/$(DOCKER_USER) vim-latest-dev

# vim:ft=make
#
