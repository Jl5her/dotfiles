export BASH_SILENCE_DEPRECATION_WARNING=1
export LANG=en_US.UTF-8

## Welcome screen
if [[ -t 1 && $- == *i* ]]; then
  if which fortune &>/dev/null && which cowsay &>/dev/null;
  then
  	fortune | cowsay -f tux
  fi
fi
# Added by LM Studio CLI (lms)
export EDITOR=/opt/homebrew/bin/nvim
