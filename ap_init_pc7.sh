# @#bash-snippets $$ measure execution time
TIMEFORMAT="It took [%R] seconds to execute this script"
time {
	# Prerequisites
	# Bash >= 5.x
	# Git >= 2.x
	
	export AP_GH_PNP29_DIR="${HOME}/pnphuong29/projects/pnphuong29.github.com/pnphuong29"
	mkdir -p "${AP_GH_PNP29_DIR}"

	# SC28
	export AP_PRJ_SC28_DIR="${AP_GH_PNP29_DIR}/ap-scripts-common-sc28"
	rm -rf "${AP_PRJ_SC28_DIR}"
	cd "${AP_GH_PNP29_DIR}"
	git clone "https://github.com/pnphuong29/ap-scripts-common-sc28.git"

	# SC21
	ap_prj_scripts_name="ap-scripts-pc7-sc21"
	export AP_PRJ_SCRIPTS_DIR="${AP_GH_PNP29_DIR}/${ap_prj_scripts_name}"
	rm -rf "${AP_PRJ_SCRIPTS_DIR}"
	cd "${AP_GH_PNP29_DIR}"
	git clone "https://github.com/pnphuong29/${ap_prj_scripts_name}.git"

	# Setup apps
	source "${AP_PRJ_SC28_DIR}/ap_setup_vendors.sh"
	source "${AP_PRJ_SCRIPTS_DIR}/ap_master.sh"
}
