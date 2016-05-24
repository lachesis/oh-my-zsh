# allows 'incognito' mode where commands aren't logged to the history
# to start, run 'incognito' function.  (prompt bars will change to cyan)
# to stop, run 'normal' function.  (prompt bars will return to white)

accept-line() {
  if [ "$INCOGNITO" = "TRUE" ]
  then
    BUFFER=" $BUFFER"  # prepend a space to avoid history
  fi
  zle .accept-line
}
zle -N accept-line

function toggle-incognito() {
  if [ "$INCOGNITO" = "TRUE" ]
  then
    export INCOGNITO="FALSE"
  else
    export INCOGNITO="TRUE"
  fi

  zle .clear-screen
  local nested=${(%):-%_}
  if [[ -n $nested ]]
  then
    zle .push-line-or-edit
  else
    zle .push-input
    zle .send-break
  fi
}

zle -N toggle-incognito
bindkey '\Cp' toggle-incognito
