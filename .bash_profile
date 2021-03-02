for file in ~/.{path,bash_prompt,aliases,extra}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;

# Enable history expansion with space
# E.g. typing !!<space> will replace the !! with your last command
bind Space:magic-space

# keep history up to date, across sessions, in realtime
# http://unix.stackexchange.com/a/48113
export HISTCONTROL="ignoredups" 				# no duplicate entries, but keep space-prefixed commands
export HISTSIZE=100000							# big big history (default is 500)
export HISTFILESIZE=$HISTSIZE   				# big big history
type shopt &> /dev/null && shopt -s histappend  # append to history, don't overwrite it

# Don't record some commands
export HISTIGNORE="&:[ ]*:exit:ls:bg:fg:history:clear"

# Save multi-line commands as one command
shopt -s cmdhist

# Save and reload the history after each command finishes
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


# ^ the only downside with this is [up] on the readline will go over all history not just this bash session.

##
## better `cd`'ing
##

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob;

# Correct spelling errors in arguments supplied to cd
shopt -s cdspell;

# Autocorrect on directory names to match a glob.
shopt -s dirspell 2> /dev/null

# Turn on recursive globbing (enable ** to recurse all directories)
shopt -s globstar 2> /dev/null


## Welcome screen

if which fortune &>/dev/null && which cowsay &>/dev/null;
then
	fortune | cowsay -f tux
fi