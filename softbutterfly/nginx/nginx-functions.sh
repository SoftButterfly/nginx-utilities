#!/bin/bash
# ------------------------------------------------------------------------------
# softbutterfly::nginx::functions
# -------------------------------
# nginx-functions.sh script contains useful and reusable functions for other
# scripts in this NGINX::Utilities Scripts Collection
#
# See more at https://github.com/softbutterfly/nginx-utilities
#
# @zodiacfireworks (https://github.com/zodiacfireworks)
# zodiacfireworks@softbutterfly.io
#

# ------------------------------------------------------------------------------
# Loading auxiliary scripts
source nginx-variables.sh


# ------------------------------------------------------------------------------
# Basic variables
NGINX_FILE_NAME="$(basename "$0" 2> /dev/null)"


# ------------------------------------------------------------------------------
# Prevent file execution
if [[ -n $BASH_VERSION ]] && [[ "$(basename "$0" 2> /dev/null)" == "nginx-functions.sh" ]]; then
    >&2 echo ${NGINX_CODE_PREFIX_ERROR}
    >&2 echo "File    : ${NGINX_FILE_NAME}"
    >&2 echo "Message : This script is intended to be sourced inside of other"
    >&2 echo "          scripts in ${NGINX_COLLECTION_NAME}. Not to be executed"
    >&2 echo "          as independent script."
    exit 1
fi


# ------------------------------------------------------------------------------
# Function    :
#   is_run_as_root ()
# Arguments   :
#   * $1 (script_name) -> script from this function is called.
# Description :
#   Verify if script is running as root user.
#
is_run_as_root () {
    local __script_name="$1"

    if [ "$(id -u)" != "0" ]; then
        >&2 echo ${NGINX_CODE_PREFIX_ERROR}

        if [ -n "$__script_name" ]; then
            >&2 echo "File    : ${__script_name}"
        fi

        >&2 echo "Message : This script must be run as root."
        >&2 echo ""

        exit 1
    fi
}


# ------------------------------------------------------------------------------
# Function    :
#   is_function_run_whit_no_arguments ()
# Arguments   :
#   * $1 (function_name) -> function from this function is called.
#   * $2 (function_rargs) -> number of required arguments to function_name.
#   * $3 (function_gargs) -> number of given arguments to function_name.
# Description :
#   Verify if function is running whit the correct number of arguments
#
is_function_run_whit_wrong_nargs () {
    local __this_name="is_function_run_whit_wrong_nargs"
    local __this_rargs=3
    local __this_gargs="$#"

    if [ "$__this_rargs" != "$__this_gargs" ]; then
        is_function_run_whit_wrong_nargs "$__this_name" "$__this_rargs" "$__this_gargs"

    else
        local __function_name="$1"
        local __function_rargs="$2"
        local __function_gargs="$3"

        if [ "$__function_rargs" -ne "$__function_gargs" ]; then
            if [ -z "$__function_name" ]; then
                local __function_name="Unknown function"
            fi

            >&2 echo "$NGINX_CODE_PREFIX_ERROR"
            >&2 echo "Function : $__function_name."
            >&2 echo "Message  : This function was executed with $__function_gargs arguments but $__function_rargs are required."
            >&2 echo ""

            exit 1
        fi
    fi
}


# ------------------------------------------------------------------------------
# Function    :
#   is_script_run_whit_wrong_nargs ()
# Arguments   :
#   * $1 (script_name) -> script from this function is called.
#   * $2 (script_min_rargs) -> minimum number of required arguments to
#     script_name.
#   * $3 (script_gargs) -> number of given arguments to script_name.
# Description :
#   Verify if script is running without arguments
#
is_script_run_whit_wrong_nargs () {
    local __this_name="is_script_run_whit_wrong_nargs"
    local __this_rargs="3"
    local __this_gargs="$#"

    is_function_run_whit_wrong_nargs "${__this_name}" "${__this_rargs}" "${__this_gargs}"

    local __script_name="$1"
    local __script_min_rargs="$2"
    local __script_gargs="$3"

    if [ "$__script_gargs" -lt "$__script_min_rargs" ]; then
        if [ -z "$__script_name" ]; then
            local __script_name="unknown_script"
        fi

        >&2 echo "$NGINX_CODE_PREFIX_ERROR"
        >&2 echo "Script  : $__script_name."
        >&2 echo "Message : This function was executed with $__script_gargs arguments but at least"
        >&2 echo "          $__script_min_rargs are required."
        >&2 echo "          Please use '$__script_name $HELP_SH_FLAG|$HELP_LG_FLAG' to check usage."

        exit 1
    fi
}


# ------------------------------------------------------------------------------
# Function    :
#   is_unknown_flag ()
# Arguments   :
#   * $1 (script_name) -> script from this function is called.
#   * $2 (unknown_flag) -> flag recognized as unknown.
# Description :
#   Print unknown flag error message
#
is_unknown_flag () {
    local __this_name="is_unknown_flag"
    local __this_rargs="2"
    local __this_gargs="$#"

    is_function_run_whit_wrong_nargs "$__this_name" "$__this_rargs" "$__this_gargs"

    local __script_name="$1"
    local __unknown_flag="$2"

    if [ -z "$__script_name" ]; then
        local __script_name="unknown_script"
    fi

    if [ -z "$__unknown_flag" ]; then
        local __unknown_flag="unknown_flag"
    fi

    >&2 echo "$NGINX_CODE_PREFIX_ERROR"
    >&2 echo "Script  : $__script_name."
    >&2 echo "Message : Unknown flag ('$__unknown_flag') provided"
    >&2 echo "          Please use '$__script_name $HELP_SH_FLAG|$HELP_LG_FLAG' to check usage."

    exit 1
}


# ------------------------------------------------------------------------------
# Function    :
#   orphan_flag ()
# Arguments   :
#   * $1 (script_name) -> script from this function is called.
#   * $2 (orphan_flag) -> flag recognized as unknown.
# Description :
#   Print orphan flag error message
#
orphan_flag () {
    local __this_name="orphan_flag"
    local __this_rargs="2"
    local __this_gargs="$#"

    is_function_run_whit_wrong_nargs "$__this_name" "$__this_rargs" "$__this_gargs"

    local __script_name="$1"
    local __orphan_flag="$2"

    if [ -z "$__script_name" ]; then
        local __script_name="unknown_script"
    fi

    if [ -z "$__orphan_flag" ]; then
        local __orphan_flag="unknown_flag"
    fi

    >&2 echo "$NGINX_CODE_PREFIX_ERROR"
    >&2 echo "Script  : $__script_name."
    >&2 echo "Message : This flag ('$__orphan_flag') needs one argument to be used."
    >&2 echo "          Please use '$__script_name $HELP_SH_FLAG|$HELP_LG_FLAG' to check usage."

    exit 1
}


# ------------------------------------------------------------------------------
# Function    :
#   get_directory_name ()
# Arguments   :
#   * $1 (relative_dof_path) -> directory or file path.
# Description :
#   Return the absolute path for the container directory of a given file or
#   directory path.
# Notes:
#   * dof stands for "directory or file"
#
get_directory_name () {
    local __this_name="get_directory_name"
    local __this_rargs="1"
    local __this_gargs="$#"

    is_function_run_whit_wrong_nargs "$__this_name" "$__this_rargs" "$__this_gargs"

    local __relative_dof_path="$1"

    echo "$(cd "$(dirname "$__relative_dof_path")" && pwd)"
}


# ------------------------------------------------------------------------------
# Function    :
#   get_absolute_path ()
# Arguments   :
#   * $1 (relative_dof_path) -> directory or file path.
# Description :
#   Return the absolute path for a given path
# Notes:
#   * dof stands for "Directory Or File"
#
get_absolute_path () {
    local __this_name="get_absolute_path"
    local __this_rargs="1"
    local __this_gargs="$#"

    is_function_run_whit_wrong_nargs "$__this_name" "$__this_rargs" "$__this_gargs"

    local __relative_dof_path="$1"

    local __dir_name="$(get_directory_name "$__relative_dof_path")"
    local __dof_name="$(basename "$__relative_dof_path" 2> /dev/null)"

    if [[ "${__dir_name: -1}" != "/" ]]; then
        local __dir_name="$__dir_name""/"
    fi

    echo "$__dir_name""$__dof_name"
}

# ------------------------------------------------------------------------------
# Function    :
#   get_file_name ()
# Arguments   :
#   * $1 (file_path) -> file path.
# Description :
#   Return the name without extension of a given file
#
get_file_name () {
    local __this_name="get_file_name"
    local __this_rargs="1"
    local __this_gargs="$#"

    is_function_run_whit_wrong_nargs "$__this_name" "$__this_rargs" "$__this_gargs"

    local __file_path="$1"
    local __absolute_path="$(get_absolute_path $__file_path)"

    local __file_name="$(basename "$__absolute_path" 2> /dev/null)"

    local __file_name="${__file_name%.*}"

    echo "$__file_name"
}


# ------------------------------------------------------------------------------
# Function    :
#   get_file_extension ()
# Arguments   :
#   * $1 (file_path) -> file path.
# Description :
#   Return the extension of a given file
#
get_file_extension () {
    local __this_name="get_file_extensions"
    local __this_rargs="1"
    local __this_gargs="$#"

    is_function_run_whit_wrong_nargs "$__this_name" "$__this_rargs" "$__this_gargs"

    local __file_path="$1"
    local __absolute_path="$(get_absolute_path $__file_path)"

    local __file_name="$(basename "$__absolute_path" 2> /dev/null)"

    local __file_extension="${__file_name##*.}"

    echo "$__file_extension"
}


# ------------------------------------------------------------------------------
# Function    :
#   get_site_enabled_config_file_path ()
# Arguments   :
#   * $1 (site_name) -> nginx site name.
# Description :
#   Return the absolute path to the config file of site_name
#
get_site_enabled_config_file_path () {
    local __this_name="get_site_enabled_config_file_path"
    local __this_rargs="1"
    local __this_gargs="$#"

    is_function_run_whit_wrong_nargs "$__this_name" "$__this_rargs" "$__this_gargs"

    local __site_name="$1.conf"
    local __dir_name=$NGINX_ENABLED_SITES_DIRECTORY

    if [[ "${__dir_name: -1}" != "/" ]]; then
        local __dir_name="$__dir_name""/"
    fi

    echo "$__dir_name""$__site_name"
}


# ------------------------------------------------------------------------------
# Function    :
#   get_site_available_config_file_path ()
# Arguments   :
#   * $1 (site_name) -> nginx site name.
# Description :
#   Return the absolute path to the config file of site_name
#
get_site_available_config_file_path () {
    local __this_name="get_site_available_config_file_path"
    local __this_rargs="1"
    local __this_gargs="$#"

    is_function_run_whit_wrong_nargs "$__this_name" "$__this_rargs" "$__this_gargs"

    local __site_name="$1.conf"
    local __dir_name=$NGINX_AVAILABLE_SITES_DIRECTORY

    if [[ "${__dir_name: -1}" != "/" ]]; then
        local __dir_name="$__dir_name""/"
    fi

    echo "$__dir_name""$__site_name"
}


# ------------------------------------------------------------------------------
# Function    :
#   is_directory ()
# Arguments   :
#   * $1 (dir_name) -> directory path.
# Description :
#   Checks if the given path is a directory
#
is_directory () {
    local __this_name="is_directory"
    local __this_rargs="1"
    local __this_gargs="$#"

    is_function_run_whit_wrong_nargs "$__this_name" "$__this_rargs" "$__this_gargs"

    local __dir_name="$1"
    local __dir_path="$(get_absolute_path "$__dir_name")"

    if [[ -d "$__dir_path" ]];  then
        true
    else
        false
    fi
}


# ------------------------------------------------------------------------------
# Function    :
#   is_file ()
# Arguments   :
#   * $1 (file_name) -> file path.
# Description :
#   Checks if the given path is a file.
#
is_file () {
    local __this_name="is_file"
    local __this_rargs="1"
    local __this_gargs="$#"

    is_function_run_whit_wrong_nargs "$__this_name" "$__this_rargs" "$__this_gargs"

    local __file_name="$1"
    local __file_path="$(get_absolute_path "$__file_name")"

    if [[ -f "$__file_path" ]]; then
        true
    else
        false
    fi
}

# ------------------------------------------------------------------------------
# Function    :
#   is_sym_link ()
# Arguments   :
#   * $1 (sl_name) -> symbolic link path.
# Description :
#   Checks if the given path is a symbolic link.
#
is_sym_link () {
    local __this_name="is_sym_link"
    local __this_rargs="1"
    local __this_gargs="$#"

    is_function_run_whit_wrong_nargs "$__this_name" "$__this_rargs" "$__this_gargs"

    local __sl_name="$1"
    local __sl_path="$(get_absolute_path "$__sl_name")"

    if [[ -h "$__sl_path" ]]; then
        true
    else
        false
    fi
}
