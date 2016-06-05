#!/bin/bash
# ------------------------------------------------------------------------------
# NGINX::Utilities::Variables
# ---------------------------
# nginx-Variables.sh script contains comon variables to be used for other
# scripts in this NGINX::Utilities Scripts Collection
#
# --
# See more at https://github.com/SoftButterfly/nginx-utilities
#
# --
# @ZodiacFireworks (Martin Vuelta)
# martin.vuelta@gmail.com

# ------------------------------------------------------------------------------
# Prevent Execution

if [[ -n $BASH_VERSION ]] && [[ "$(basename "$0" 2> /dev/null)" == "nginx-variables.sh" ]]; then
    >&2 echo "NGINX::Utilities::ERROR"
    >&2 echo "File    : $(basename "$0" 2> /dev/null)"
    >&2 echo "Message : This script is intended to sourced inside of other scripts in"
    >&2 echo "          NGINX::Utilities Scripts Collection. Not to be executed as"
    >&2 echo "          independent part."
    exit 1
fi


# ------------------------------------------------------------------------------
# Inicialization

NGINX_FILE_NAME="$(basename "$0" 2> /dev/null)"
NGINX_COMMON_PREFIX="NGINX"
NGINX_COLLECTION_NAME=$NGINX_COMMON_PREFIX"::Utilities"
NGINX_CODE_PREFIX_ERROR=$NGINX_COLLECTION_NAME"::ERROR"
NGINX_CODE_PREFIX_WARNING=$NGINX_COLLECTION_NAME"::WARNING"

NGINX_ENABLED_SITES_DIRECTORY="/etc/nginx/sites-enabled"
NGINX_AVAILABLE_SITES_DIRECTORY="/etc/nginx/sites-available"

FILE_SH_FLAG="-f"
FILE_LG_FLAG="--file"

SITE_SH_FLAG="-s"
SITE_LG_FLAG="--site"

HELP_SH_FLAG="-h"
HELP_LG_FLAG="--help"
