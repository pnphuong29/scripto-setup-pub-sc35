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

	# Configure ssh
	mkdir -p ~/.ssh
	mkdir -p ~/pnphuong29/keys
	chmod 700 ~/pnphuong29/keys

	read -p "Please press [y] after you add private key: "
	if [[ "${REPLY}" == 'y' ]]; then
		ln -s ~/pnphuong29/one-drive/pnphuong29/OneDrive/keys/ap_pnphuong29.key.priv ~/pnphuong29/keys/ap_pnphuong29.key.priv
		chmod 400 *.key.priv

		cat <<-EOF >~/.ssh/config
			# General
			Host *
				IdentitiesOnly yes
				AddKeysToAgent yes
				UseKeychain yes
				IdentityFile ~/pnphuong29/keys/ap_pnphuong29.key.priv

			Host p29-*
				User git

			# pnphuong29
			Host p29-gitlab
				HostName gitlab.com
			 
			Host p29-github
				HostName github.com
		EOF

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
	fi
}
