# Notes
# - This script should be used to setup macOS >= 10.15
# Usage
# - Download this script into any location owned by current user
# - Run the command `source script_file_name.sh`

# @#bash-snippets $$ measure execution time
TIMEFORMAT="It took [%R] seconds to execute this script"
time {
	# Install homebrew
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

	# Install essential and required apps
	echo "Installing essential and required apps"
	brew install bash git curl wget

	# Configure ssh
	echo "Configuring ssh"
	mkdir -p ~/.ssh
	mkdir -p ~/pnphuong29/secrets
	chmod 700 ~/pnphuong29/secrets

	touch ~/pnphuong29/secrets/ap_rsync_user.passwd
	chmod 600 ~/pnphuong29/secrets/ap_rsync_user.passwd

	echo "You should install OneDrive on your local machine now"
	read -p "Please press [y] after you added private key: "
	if [[ "${REPLY}" == 'y' ]]; then
		ln -s ~/pnphuong29/nextcloud/pnphuong29/secrets/ap_pnphuong29.key.priv ~/pnphuong29/secrets/ap_pnphuong29.key.priv
		chmod 400 *.key.priv

		curl -SsL "https://raw.githubusercontent.com/pnphuong29/ap-scripts-init-sc35/master/ap_ssh.config" >~/.ssh/config
		chmod 600 ~/.ssh/config
		chmod 600 ~/.ssh/authorized_keys

		export AP_GH_P29_DIR="${HOME}/pnphuong29/projects/p29-github/pnphuong29"
		mkdir -p "${AP_GH_P29_DIR}"

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
		echo "Installing vendors"
		source "${AP_PRJ_SCRIPTS_DIR}/ap_setup_vendors.sh"
		source "${AP_PRJ_SCRIPTS_DIR}/ap_master.sh"
	fi
}
