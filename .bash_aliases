alias mc='EDITOR=vim mc -S dark'
alias vpnconnect='/opt/cisco/anyconnect/bin/vpn connect vpn.mgsn.it:8443'
alias vpndisconnect='/opt/cisco/anyconnect/bin/vpn disconnect'
alias vpnstatus='/opt/cisco/anyconnect/bin/vpn status'
alias dnfup='sudo dnf clean metadata && sudo dnf upgrade'
alias vim='gvim -v'
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

