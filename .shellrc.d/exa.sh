#!/bin/sh

if command -v exa >/dev/null; then
	alias ls='exa --icons'
	alias ll='exa --icons -lrs mod'
	alias ls1='exa -1'
fi
