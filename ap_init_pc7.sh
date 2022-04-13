source <(curl https://raw.githubusercontent.com/pnphuong29/ap-scripts-public-sc35-pub7/master/ap_init.sh)

ap_prj_scripts_name="ap-scripts-pc7-sc21"
export AP_PRJ_SCRIPTS_DIR="${AP_GH_PNP29_DIR}/${ap_prj_scripts_name}"
rm -rf "${AP_RPJ_SCRIPTS_DIR}"
cd "${AP_GH_PNP29_DIR}"
git clone "https://github.com/pnphuong29/${ap_prj_scripts_name}"
source "${AP_PRJ_SCRIPTS_DIR}/ap_setup_vendors.sh"
