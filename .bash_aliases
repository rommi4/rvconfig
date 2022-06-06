alias mc='EDITOR=vim mc -S dark'
alias dnfup='sudo dnf clean metadata && sudo dnf upgrade'
alias vim='gvim -v'
alias vimdiff='gvimdiff -v'
alias weather='curl http://wttr.in/Minsk'
alias bton='echo "power on" | bluetoothctl'

### activate virtualenv
#alias ae='deactivate &> /dev/null; source ./venv/bin/activate'

bssh()
{
  ssh -p2200 -A $1@bwc-$1.wgdp.io $2
}

apmup()
{
  apm update --no-confirm
}

