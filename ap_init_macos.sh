# @#bash-snippets $$ measure execution time
TIMEFORMAT="It took [%R] seconds to execute this script"
time {
	export AP_GH_P29_DIR="${HOME}/pnphuong29/projects/p29-github/pnphuong29"
	mkdir -p "${AP_GH_P29_DIR}"

	# Install homebrew
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

	# Install latest git
	brew install git

	# Install latest bash (>= 5.x)
	brew install bash

	# SC28
	export AP_PRJ_SC28_DIR="${AP_GH_P29_DIR}/ap-scripts-common-sc28"
	rm -rf "${AP_PRJ_SC28_DIR}"
	cd "${AP_GH_P29_DIR}"
	git clone "git@p29-github:pnphuong29/ap-scripts-common-sc28.git"

	# SC7
	ap_prj_scripts_name="ap-scripts-macos-sc7"
	export AP_PRJ_SCRIPTS_DIR="${AP_GH_P29_DIR}/${ap_prj_scripts_name}"
	rm -rf "${AP_PRJ_SCRIPTS_DIR}"
	cd "${AP_GH_P29_DIR}"
	git clone "git@p29-github:pnphuong29/${ap_prj_scripts_name}.git"

	# Setup apps
	source "${AP_PRJ_SCRIPTS_DIR}/ap_setup_vendors.sh"
	source "${AP_PRJ_SCRIPTS_DIR}/ap_master.sh"
}