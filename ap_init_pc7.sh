eval "$(curl -SsL https://raw.githubusercontent.com/pnphuong29/ap-scripts-public-sc35-pub7/master/ap_init_pc7.sh)"

export AP_PRJ_SCRIPTS_DIR="${AP_GH_PNP29_DIR}/ap-scripts-pc7-sc21"
rm -rf "${AP_RPJ_SCRIPTS_DIR}"
cd "${AP_GH_PNP29_DIR}"
git clone "https://github.com/pnphuong29/ap-scripts-pc7-sc21.git"
source "${AP_PRJ_SCRIPTS_DIR}/ap_setup_vendors.sh"
