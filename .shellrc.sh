#!/bin/sh

DOTFILES="$HOME/.dotfiles"

addpath () {
  if [ -d $1 ]; then
		newpath="$PATH:$1"
		if [ "$2" = "pre" ]; then
			newpath="$1:$PATH"
		fi
    case ":$PATH:" in
      *:$1:*) ;;
      *) export PATH="$newpath" ;;
    esac
		unset newpath
  fi
}

addlibpath () {
  if [ -d $1 ]; then
    case ":$LD_LIBRARY_PATH:" in
      *:$1:*) ;;
      *) export LD_LIBRARY_PATH="$1:$LD_LIBRARY_PATH" ;;
    esac
  fi
}

dtf () {
  MODULE=$1
  shift
  git --git-dir="$DOTFILES/$MODULE" --work-tree="$HOME" "$@"
}

dtfclone () {
  mkdir -p "$DOTFILES"
  DISPOSABLE=$(mktemp -dt dtf-XXXXXX)
  git clone -c status.showUntrackedFiles=no -n --separate-git-dir "$DOTFILES/$1" "$2" "$DISPOSABLE"
  rm -rf "$DISPOSABLE"
}

dtfnew () {
  dtfclone "$1" "$2"

  echo "Please add and commit additional files"
  echo "using 'dtf $1 add' and 'dtf $1 commit', then run"
  echo "dtf $1 push -u origin HEAD"
}

dtfrestore () {
  dtfclone "$1" "$2"
  #dtf $MODULE branch -t $(dtf $MODULE symbolic-ref --short HEAD) origin/HEAD
  dtf $1 checkout || echo -e "Deal with conflicting files, then run (possibly with -f flag if you are OK with overwriting)\ndtf $1 checkout"
}

dtfcheck () {
	for mod in $(find "$DOTFILES" -maxdepth 1 -mindepth 1 -type d); do
		printf "$(basename $mod):\n"
		git --git-dir="$mod" remote update >/dev/null
		git --git-dir="$mod" status "$@"
	done
}

addpath "$HOME/.local/bin" pre
addpath "$HOME/.venv/bin" pre
addlibpath "$HOME/.local/lib"

if [ -d ~/.shellrc.d ]; then
  for rc in ~/.shellrc.d/*; do
    if [ -f "$rc" ]; then
      . "$rc"
    fi
  done
fi
unset rc

command -v nvim >/dev/null && export EDITOR=nvim
