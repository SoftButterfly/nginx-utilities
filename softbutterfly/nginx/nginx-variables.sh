#!/bin/bash
# ------------------------------------------------------------------------------
# softbutterfly::nginx::variables
# -------------------------------
# nginx-variables.sh script contains comon variables to be used for other
# scripts in softbutterfly::nginx scripts collection
#
# See more at https://github.com/softbutterfly/nginx-utilities
#
# @zodiacfireworks (https://github.com/zodiacfireworks)
# zodiacfireworks@softbutterfly.io
#

# ------------------------------------------------------------------------------
# Basic variables
NGINX_FILE_NAME="$(basename "$0" 2> /dev/null)"
NGINX_COMMON_PREFIX="softbutterlfy"
NGINX_COLLECTION_NAME=$NGINX_COMMON_PREFIX"::nginx"
NGINX_CODE_PREFIX_ERROR=$NGINX_COLLECTION_NAME"::error"
NGINX_CODE_PREFIX_WARNING=$NGINX_COLLECTION_NAME"::warning"


# ------------------------------------------------------------------------------
# Prevent file execution
if [[ -n $BASH_VERSION ]] && [[ "$(basename "$0" 2> /dev/null)" == "nginx-variables.sh" ]]; then
    >&2 echo ${NGINX_CODE_PREFIX_ERROR}
    >&2 echo "File    : ${NGINX_FILE_NAME}"
    >&2 echo "Message : This script is intended to be sourced inside of other"
    >&2 echo "          scripts in ${NGINX_COLLECTION_NAME}. Not to be executed"
    >&2 echo "          as independent script."
    exit 1
fi


# ------------------------------------------------------------------------------
# Variables
NGINX_ENABLED_SITES_DIRECTORY="/etc/nginx/sites-enabled"
NGINX_AVAILABLE_SITES_DIRECTORY="/etc/nginx/sites-available"

FILE_SH_FLAG="-f"
FILE_LG_FLAG="--file"

SITE_SH_FLAG="-s"
SITE_LG_FLAG="--site"

HELP_SH_FLAG="-h"
HELP_LG_FLAG="--help"
