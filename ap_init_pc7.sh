TIMEFORMAT="It took [%R] seconds to execute this script"
time {
	source <(curl https://raw.githubusercontent.com/pnphuong29/ap-scripts-public-sc35-pub7/master/ap_init.sh)

	ap_prj_scripts_name="ap-scripts-pc7-sc21"
	export AP_PRJ_SCRIPTS_DIR="${AP_GH_PNP29_DIR}/${ap_prj_scripts_name}"
	cd "${AP_GH_PNP29_DIR}"
	rm -rf "${AP_PRJ_SCRIPTS_DIR}"

	git clone "https://github.com/pnphuong29/${ap_prj_scripts_name}.git"

	source "${AP_PRJ_SC28_DIR}/vendors/common-apps/ap_setup_common_apps.sh"
	source "${AP_PRJ_SCRIPTS_DIR}/ap_master.sh"
}
