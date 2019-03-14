alias rvenv='pushd ~/wg/hiera-backend/ && git pull && popd && \
                pushd ~/wg/puppet-dev/ && git checkout master && git pull && git submodule update --init && git status && git br && popd && \
                pushd ~/wg/ddns/ && git pull && popd && \
                pushd ~/wg/clusters-info/ && git pull && popd &&\
                chmod 400 ~/.ssh/config '
alias mc='EDITOR=vim mc -S dark'
alias vpnby1connect='/opt/cisco/anyconnect/bin/vpn connect by1-vpn.wargaming.net'
alias vpndisconnect='/opt/cisco/anyconnect/bin/vpn disconnect'
alias vpnstatus='/opt/cisco/anyconnect/bin/vpn status'
alias dnfup='sudo dnf clean metadata && sudo dnf upgrade'
alias vim='gvim -v'
# alias apmup='apm update --no-confirm'
alias weather='curl http://wttr.in/Minsk'
alias bton='echo "power on" | bluetoothctl'

### activate virtualenv
#alias ae='deactivate &> /dev/null; source ./venv/bin/activate'

alias nbrb="curl http://www.nbrb.by/API/ExRates/Rates?Periodicity=0 | jq 'sort_by(.Cur_Abbreviation) | .[] | select((.Cur_ID==145) or (.Cur_ID==292) or (.Cur_ID==298)) | {Cur_Abbreviation, Cur_OfficialRate}'"

bssh()
{
  ssh -p2200 -A $1@bwc-$1.wgdp.io $2
}

apmup()
{
#  ATOM_INSTALLED_VERSION=$(rpm -qi atom | grep "Version" | cut -d ':' -f 2 | cut -d ' ' -f 2)
#  ATOM_LATEST_VERSION=$(curl -sL -u rommi4:$(grep GITHUB ~/.rvx_creds | cut -f2 -d'=') "https://api.github.com/repos/atom/atom/releases/latest" | grep -E "https.*atom-amd64.tar.gz" | cut -d '"' -f 4 | cut -d '/' -f 8 | sed 's/v//g')
#  echo "ATOM_INSTALLED_VERSION: $ATOM_INSTALLED_VERSION"
#  echo "ATOM_LATEST_VERSION: $ATOM_LATEST_VERSION"
#
#  if [[ $ATOM_INSTALLED_VERSION < $ATOM_LATEST_VERSION ]]; then
#    sudo dnf install -y https://github.com/atom/atom/releases/download/v${ATOM_LATEST_VERSION}/atom.x86_64.rpm
#  fi

  apm update --no-confirm
}


# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

