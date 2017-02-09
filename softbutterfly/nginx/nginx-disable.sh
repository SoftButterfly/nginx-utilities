#!/bin/bash
# ------------------------------------------------------------------------------
# softbutterfly::nginx::enable
# -------------------------------
# nginx-enable.sh script enable a site or file to run under nginx
#
# See more at https://github.com/softbutterfly/nginx-utilities
#
# @zodiacfireworks (https://github.com/zodiacfireworks)
# zodiacfireworks@softbutterfly.io
#

# ------------------------------------------------------------------------------
# Loading auxiliary scripts
source nginx-functions.sh
source nginx-variables.sh


# ------------------------------------------------------------------------------
# Basic variables
NGINX_FILE_NAME="$(basename "$0" 2> /dev/null)"


# ------------------------------------------------------------------------------
# Specific functions
print_help () {
    >&2 echo "${NGINX_COLLECTION_NAME}::enable"
    >&2 echo "File    : ${NGINX_FILE_NAME}"
    # >&2 echo "Message : This script is intended to be sourced inside of other"
    # >&2 echo "          scripts in ${NGINX_COLLECTION_NAME}. Not to be executed"
    # >&2 echo "          as independent script."
    exit 1
}


# ------------------------------------------------------------------------------
# Initialization

__this_name="$(basename "$0" 2> /dev/null)"
__this_argvs="$*"
__this_argvl="$@"
__this_gargs="$#"
__this_min_rargs="2"

sites_list=()
files_list=()

sites_path_list=()
files_path_list=()


# ------------------------------------------------------------------------------
# Execution

# Verification of user
is_run_as_root $__this_name

# Verofy the correct number of args
if [[ "$__this_gargs" -ne "1" ]]; then
    is_script_run_whit_wrong_nargs "$__this_name" "$__this_min_rargs" "$__this_gargs"
fi

if [[ "$__this_gargs" -eq "1" ]]; then
    if [[ "$1" == "$HELP_SH_FLAG" || "$1" == "$HELP_LG_FLAG" ]]; then
        print_help

    elif [[ "$1" == "$FILE_SH_FLAG" || "$1" == "$FILE_LG_FLAG" ]]; then
        orphan_flag "$__this_name" "$1"

    elif [[ "$1" == "$SITE_SH_FLAG" || "$1" == "$SITE_LG_FLAG" ]]; then
        orphan_flag "$__this_name" "$1"
    fi

    sites_list[1]="$1"

else
    __fc=$((1))
    __sc=$((1))

    while [[ "$#" -gt "1" || "$#" -eq "1" ]]; do
        __flag="$1"

        case $__flag in
            $FILE_SH_FLAG|$FILE_LG_FLAG)
                __value="$2"

                if [[ -z "$__value" ]]; then
                    orphan_flag "$__this_name" "$__flag"
                fi

                files_list[__fc]="$__value"
                __fc=$(($__fc + 1))

                shift
            ;;

            $SITE_SH_FLAG|$SITE_LG_FLAG)
                __value="$2"

                if [[ -z "$__value" ]]; then
                    orphan_flag "$__this_name" "$__flag"
                fi

                sites_list[__sc]="$__value"
                __sc=$(($__sc + 1))

                shift
            ;;

            $HELP_SH_FLAG|$HELP_LG_FLAG)
                print_help $__this_name

                shift
            ;;

            *)
                is_unknown_flag "$__this_name" "$__flag"

                shift
            ;;
        esac

        shift
    done
fi


__fc=$((1))
for file_name in ${files_list[@]}; do
    files_path_list[__fc]=$(get_absolute_path $file_name)
    echo ${files_path_list[__fc]}
    files_list[__fc]="$(basename "${files_path_list[$__fc]}" 2> /dev/null)"
    __fc=$(($__fc + 1))
done


__sc=$((1))
for site_name in ${sites_list[@]}; do
    sites_path_list[__sc]=$(get_site_enabled_config_file_path $site_name)
    echo ${sites_path_list[__sc]}
    __sc=$(($__sc + 1))
done


__sc=$((1))
for site_path in ${sites_path_list[@]}; do
    site_name="${sites_list[$__sc]}"

    if is_directory $site_path; then
        >&2 echo "$NGINX_CODE_PREFIX_WARNING"
        >&2 echo "Script  : $__this_name."
        >&2 echo "Site    : $site_path"
        >&2 echo "Message : Skkiping becuase provided path is a directroy."
        >&2 echo ""

    elif is_file $site_path; then
        __yes_delete="n"

        if !(is_sym_link $site_path); then
            >&2 echo "$NGINX_CODE_PREFIX_WARNING"
            >&2 echo "Script  : $__this_name."
            >&2 echo "Site    : $site_name"
            >&2 echo "Message : Provided path is not a symlink."
            >&2 echo -n "Do you want disable this site [y/N]? "
            read __yes_delete;

            if [[ "$__yes_delete" == "y" || "$__yes_delete" == "Y" ]]; then
                echo -n "* Disabling site '$site_name' ... "
                rm -f $site_path
                echo "Ok."
                echo ""
            else
                echo "* Skipping site '$site_name'"
                echo ""
            fi
        else
            echo -n "* Disabling site '$site_name' ... "
            rm -f $site_path
            echo "Ok."
            echo ""
        fi

    else
        >&2 echo "$NGINX_CODE_PREFIX_WARNING"
        >&2 echo "Script  : $__this_name."
        >&2 echo "File    : $site_name"
        >&2 echo "Message : Skkiping becuase provided site doesn't exist."
        >&2 echo ""
    fi

    __sc=$(($__sc + 1))
done


__fc=$((1))
for file_path in ${files_path_list[@]}; do
    file_name="${files_list[$__fc]}"

    if is_directory $file_path; then
        >&2 echo "$NGINX_CODE_PREFIX_WARNING"
        >&2 echo "Script  : $__this_name."
        >&2 echo "File    : $file_name"
        >&2 echo "Message : Skkiping becuase provided path is a directroy."
        >&2 echo ""

    elif is_file $file_path; then
        __yes_delete="n"

        if !(is_sym_link $file_path); then
            >&2 echo "$NGINX_CODE_PREFIX_WARNING"
            >&2 echo "Script  : $__this_name."
            >&2 echo "File    : $file_name"
            >&2 echo "Message : Provided path is not a symlink."
            >&2 echo -n "Do you want disable this site [y/N]? "
            read __yes_delete;

            if [[ "$__yes_delete" == "y" || "$__yes_delete" == "Y" ]]; then
                echo -n "* Disabling file '$file_name' ... "
                rm -f $file_path
                echo "Ok."
                echo ""
            else
                echo "* Skipping file '$file_name'"
                echo ""
            fi
        else
            echo -n "* Disabling file '$file_name' ... "
            rm -f $file_path
            echo "Ok."
            echo ""
        fi

    else
        >&2 echo "$NGINX_CODE_PREFIX_WARNING"
        >&2 echo "Script  : $__this_name."
        >&2 echo "File    : $file_path"
        >&2 echo "Message : Skkiping becuase provided path doesn't exist."
        >&2 echo ""
    fi

    __fc=$(($__fc + 1))
done

nginx -s reload
