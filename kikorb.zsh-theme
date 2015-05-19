# Kikorb - created by kikorb
# Initially hacked from the CRUNCH theme. Thanks, CRUNCH.
# Initially hacked from the Dallas theme. Thanks, Dallas Reedy.
#
# This theme assumes you do most of your oh-my-zsh'ed "colorful" work at a single machine,
# and eschews the standard space-consuming user and hostname info.  Instead, only the
# things that vary in my own workflow are shown:
#
# * The time (not the date)
# * The RVM version and gemset (omitting the 'ruby' name if it's MRI)
# * The current directory
# * The Git branch and its 'dirty' state
#
# Colors are at the top so you can mess with those separately if you like.
# For the most part I stuck with Dallas's.

BRACKET_COLOR="%{$fg[blue]%}"
RVM_COLOR="%{$fg[red]%}"
DIR_COLOR="%{$fg[cyan]%}"
GIT_BRANCH_COLOR="%{$fg[green]%}"
GIT_CLEAN_COLOR="%{$fg[green]%}"
GIT_DIRTY_COLOR="%{$fg[red]%}"

# These Git variables are used by the oh-my-zsh git_prompt_info helper:
ZSH_THEME_GIT_PROMPT_PREFIX="$BRACKET_COLOR:$GIT_BRANCH_COLOR"
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_CLEAN=" $GIT_CLEAN_COLOR✓"
ZSH_THEME_GIT_PROMPT_DIRTY=" $GIT_DIRTY_COLOR✗"

# Our elements:
if [ -e ~/.rvm/bin/rvm-prompt ]; then
  RVM_="$BRACKET_COLOR"["$RVM_COLOR\${\$(~/.rvm/bin/rvm-prompt i v g)#ruby-}$BRACKET_COLOR"]"%{$reset_color%}"
else
  if which rbenv &> /dev/null; then
    RVM_="$BRACKET_COLOR"["$RVM_COLOR\${\$(rbenv version | sed -e 's/ (set.*$//' -e 's/^ruby-//')}$BRACKET_COLOR"]"%{$reset_color%}"
  fi
fi
DIR_="$DIR_COLOR%c\$(git_prompt_info) ➜"
MY_PROMPT="$BRACKET_COLOR "

# Put it all together!
PROMPT="$RVM_$DIR_$MY_PROMPT%{$reset_color%}"


