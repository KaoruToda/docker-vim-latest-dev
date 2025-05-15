#
# Makefile
# kaoru, 2025-05-05 21:08
#

all:


build::
	sudo docker build -t vim-latest-dev .

run::
	sudo docker run -it -v /home/$(USER)/tmp/vimrc:/home/$(USER) vim-latest-dev

# vim:ft=make
#
