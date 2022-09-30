# .bash_profile

if [ -f ~/.bashrc ]; then
	. ~/.shellrc.sh
fi

[ "$(tty)" = "/dev/tty1" ] && exec sway
