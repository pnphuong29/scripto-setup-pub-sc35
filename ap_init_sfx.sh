source "$(dirname "${BASH_SOURCE[0]}")/ap_init.sh"

export AP_PRJ_SCRIPTS_DIR="${AP_GH_PNP29_DIR}/ap-scripts-sfx-sc14"

if [[ ! -d "${AP_PRJ_SCRIPTS_DIR}" ]]; then
	git clone "https://github.com/pnphuong29/ap-scripts-sfx-sc14.git"
fi

if [[ -d "${AP_PRJ_SCRIPTS_DIR}" ]]; then
	source "${AP_PRJ_SCRIPTS_DIR}/ap_setup_vendors.sh"
fi
