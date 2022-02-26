gitconfigs=$(find ~/.config/git/gitconfig.d/ -maxdepth 1 -mindepth 1 -type f -not -name '.*' | sort)
gitincludefiles=$(git config --get-all include.path | rg '.config/git/gitconfig.d')
if [ -n "$gitconfigs" -a "$gitconfigs" != "$gitincludefiles" ]; then
	git config -f ~/.config/git/includes --unset-all include.path
	for conf in $gitconfigs; do
		git config -f ~/.config/git/includes --add include.path "$conf"
	done
fi

