# General
alias gplsc35='cd "${AP_PRJ_SC35_DIR}"; gpl'
alias gacpsc35='cd "${AP_PRJ_SC35_DIR}"; gacp'

# Copy setup scripts for coressponding platforms
alias sc35cpmacos-setup-script='printf "source <(curl -SsL https://raw.githubusercontent.com/pnphuong29/ap-scripts-init-sc35/master/ap_setup_macos.sh)" | pbcopy; echo'
alias sc35cpu7-setup-script='printf "source <(curl -SsL https://raw.githubusercontent.com/pnphuong29/ap-scripts-init-sc35/master/ap_setup_ubuntu7.sh)" | pbcopy; echo'
alias sc35cpu14-setup-script='printf "source <(curl -SsL https://raw.githubusercontent.com/pnphuong29/ap-scripts-init-sc35/master/ap_setup_ubuntu14.sh)" | pbcopy; echo'
