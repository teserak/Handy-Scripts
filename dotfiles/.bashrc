# These all courtesy of https://github.com/VivaCaligula/DOTFILES

# Ignore duplicate commands, & ignore commands starting with a space.
export HISTCONTROL=erasedups:ignorespace

# Keep the last 5000 entries.
export HISTSIZE=5000

# Append to the history instead of overwriting (good for multiple connections).
shopt -s histappend


# Look for and load-if-exists bash alias & prompt files

if [[ -f ~/.bash_aliases ]]; then
  . ~/.bash_aliases
fi

if [[ -f ~/.bash_prompt ]]; then
  . ~/.bash_prompt
fi

