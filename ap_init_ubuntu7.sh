# Usage
# - Download this script into any location owned by current user
# - Run the command `source script_file_name.sh`

# Prerequisites
# - bash >= 5.x
# - git >= 2.x
# - wget

# @#bash-snippets $$ measure execution time
TIMEFORMAT="It took [%R] seconds to execute this script"
time {
	# Install essential/required apps
	sudo apt-get update
	sudo apt-get install \
		git \
		wget \
		vim \
		ssh

	# Configure ssh
	mkdir -p ~/.ssh
	mkdir -p ~/pnphuong29/keys
	chmod 700 ~/pnphuong29/keys
	touch ~/pnphuong29/keys/ap_pnphuong29.key.priv
	chmod 600 ~/pnphuong29/keys/ap_pnphuong29.key.priv

	read -p "Please press [y] after you add private key: "
	if [[ "${REPLY}" == 'y' ]]; then
		cat <<-EOF >~/.ssh/config
			# General
			Host *
				IdentitiesOnly yes
				IdentityFile ~/pnphuong29/keys/ap_pnphuong29.key.priv

			Host p29-*
				User git

			# pnphuong29
			Host p29-gitlab
				HostName gitlab.com
			 
			Host p29-github
				HostName github.com
		EOF

		export AP_GH_P29_DIR="${HOME}/pnphuong29/projects/p29-github/pnphuong29"
		mkdir -p "${AP_GH_P29_DIR}"

		# SC28
		export AP_PRJ_SC28_DIR="${AP_GH_P29_DIR}/ap-scripts-common-sc28"
		rm -rf "${AP_PRJ_SC28_DIR}"
		cd "${AP_GH_P29_DIR}"
		git clone "git@p29-github:pnphuong29/ap-scripts-common-sc28.git"

		# SC21
		ap_prj_scripts_name="ap-scripts-ubuntu7-sc21"
		export AP_PRJ_SCRIPTS_DIR="${AP_GH_P29_DIR}/${ap_prj_scripts_name}"
		rm -rf "${AP_PRJ_SCRIPTS_DIR}"
		cd "${AP_GH_P29_DIR}"
		git clone "git@p29-github:pnphuong29/${ap_prj_scripts_name}.git"

		# Setup apps
		source "${AP_PRJ_SCRIPTS_DIR}/ap_setup_vendors.sh"
		source "${AP_PRJ_SCRIPTS_DIR}/ap_master.sh"
	fi
}
