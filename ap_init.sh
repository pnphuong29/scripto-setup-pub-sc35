export LC_ALL="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
export LANG="en_US.UTF-8"
export LANGUAGE="en_US"

export AP_OS_TYPE_MACOS="macos"
export AP_OS_TYPE_UBUNTU="ubuntu"
export AP_OS_TYPE_CENTOS="centos"

if [[ "$(uname)" == 'Darwin' ]]; then
	export AP_OS_TYPE="${AP_OS_TYPE_MACOS}"
elif [[ "$(uname)" == 'Linux' && "$(cat /etc/os-release | head -1 | awk -F= '{print $2}' | sed 's/"//g')" == 'Ubuntu' ]]; then
	export AP_OS_TYPE="${AP_OS_TYPE_UBUNTU}"
fi

# Initialize dir structure
export AP_USER='pnphuong29'

# Home
export AP_HOME_DIR=~/"${AP_USER}"
alias zhome='cd "${AP_HOME_DIR}"'

if [ ! -d "${AP_HOME_DIR}" ]; then
	mkdir -p "${AP_HOME_DIR}"
fi

# Sofware
export AP_SOFT_DIR="${AP_HOME_DIR}/software"
alias zsoft='cd "${AP_SOFT_DIR}"'

if [ ! -d "${AP_SOFT_DIR}/bin" ]; then
	mkdir -p "${AP_SOFT_DIR}/bin"
fi

# Tmp
export AP_TMP_DIR="${AP_HOME_DIR}/tmp"
alias ztmp='cd "${AP_TMP_DIR}"'

if [ ! -d "${AP_TMP_DIR}" ]; then
	mkdir -p "${AP_TMP_DIR}"
fi

# Keys
export AP_KEYS_DIR="${AP_HOME_DIR}/keys"
alias zkeys='cd "${AP_KEYS_DIR}"'

if [ ! -d "${AP_KEYS_DIR}" ]; then
	mkdir -p "${AP_KEYS_DIR}"
fi

# Logs
export AP_LOGS_DIR="${AP_HOME_DIR}/logs"
alias zlogs='cd "${AP_LOGS_DIR}"'

if [ ! -d "${AP_LOGS_DIR}/general" ]; then
	mkdir -p "${AP_LOGS_DIR}/general"
fi

export AP_LOGS_GENERAL_FILE="${AP_LOGS_DIR}/general/main.log"
export AP_LOGS_ERROR_FILE="${AP_LOGS_DIR}/general/error.log"

# Create general log file if not existed
[[ ! -f "${AP_LOGS_GENERAL_FILE}" ]] && printf "" >"${AP_LOGS_GENERAL_FILE}"

# Create error log file & open file descriptor 7 linking to that error log file
[[ ! -f "${AP_LOGS_ERROR_FILE}" ]] && printf "" >"${AP_LOGS_ERROR_FILE}"
exec 7<>"${AP_LOGS_ERROR_FILE}"

# Projects
export AP_PRJ_DIR="${AP_HOME_DIR}/projects"
alias zpr='cd "${AP_PRJ_DIR}"'

export AP_GH_DIR="${AP_PRJ_DIR}/github.com"
alias zgh='cd "${AP_GH_DIR}"'

if [ ! -d "${AP_GH_DIR}" ]; then
	mkdir -p "${AP_GH_DIR}"
fi

export AP_GH_PNP29_DIR="${AP_PRJ_DIR}/pnphuong29.github.com/pnphuong29"
alias zghpnp29='cd "${AP_GH_PNP29_DIR}"'

if [ ! -d "${AP_GH_PNP29_DIR}" ]; then
	mkdir -p "${AP_GH_PNP29_DIR}"
fi

# Clone SC28 project
export AP_PRJ_SC28_DIR="${AP_GH_PNP29_DIR}/ap-scripts-common-sc28"
zghpnp29

if [[ ! -d "${AP_PRJ_SC28_DIR}" ]]; then
	git clone "https://github.com/pnphuong29/ap-scripts-common-sc28.git"
fi

# Clone <scripts> project basing on input param $1
if [[ -n "${1:-}" ]]; then
	git clone "https://github.com/pnphuong29/${1}.git"
fi

if [[ -d "${1:-}" ]]; then
	export AP_PRJ_SCRIPTS_DIR="${AP_GH_PNP29_DIR}/${1}"
	cd "${AP_PRJ_SCRIPTS_DIR}"
	source "${AP_PRJ_SCRIPTS_DIR}/ap_master.sh"
fi
