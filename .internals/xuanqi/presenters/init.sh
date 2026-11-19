#!/bin/sh
# Copyright 2026 The (Holloway) Chew, Kean Ho's XuanQi Project Team (https://github.com/ChewKeanHo/software-xuanqi)
#
# The above unified aliases have one or more actual legal entities listed
# outside of this document: (1) 'CREATORS.txt' or 'AUTHORS.txt'; and
# (2) 'CONTRIBUTORS.txt'. They are located usually placed next to this document
# in their respective project repository. Please refer to them for compiling the
# complete list accordingly.
#
#
# Zero-Clause BSD
# ===============
#
# Permission to use, copy, modify, and/or distribute this software for any
# purpose with or without fee is hereby granted.
#
# THE SOFTWARE IS PROVIDED “AS IS” AND THE AUTHOR DISCLAIMS ALL WARRANTIES WITH
# REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY
# AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY SPECIAL, DIRECT,
# INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM
# LOSS OF USE, DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR
# OTHER TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR
# PERFORMANCE OF THIS SOFTWARE.




# locate XUANQI_DIRECTORY.
# This is already set by the scanner Start.sh.ps1 script. Hence, no additional
# work is required.
#
# If it is unset, this means the script is operating using invalid method to
# initialize so it **MUST** be failed at all time.
if [ "$XUANQI_DIRECTORY" = "" ]; then
	1>&2 printf -- "%s" "\
E: '\$XUANQI_DIRECTORY' -> ?!?!  <- Dev!!!

"
	return 1
elif [ "${XUANQI_DIRECTORY%"init.sh"}" = "$XUANQI_DIRECTORY" ]; then
	1>&2 printf -- "%s" "\
E: '\$XUANQI_DIRECTORY' -> ?!?!  <- Dev!!!

"
	return 1
elif [ ! -f "$XUANQI_DIRECTORY" ]; then
	1>&2 printf -- "%s" "\
E: '\$XUANQI_DIRECTORY' -> ?!?!  <- Dev!!!

"
	return 1
fi




# locate the XUANQI_DIRECTORY_ROOT App directory
XUANQI_DIRECTORY_ROOT="${XUANQI_DIRECTORY%"init.sh"}"
XUANQI_DIRECTORY_ROOT="${XUANQI_DIRECTORY_ROOT%"/"}"
XUANQI_DIRECTORY_ROOT="${XUANQI_DIRECTORY_ROOT%"presenters"}"
XUANQI_DIRECTORY_ROOT="${XUANQI_DIRECTORY_ROOT%"/"}"




# import libraries
if [ ! -f "${XUANQI_DIRECTORY_ROOT}/interactors/libraries/runtimes/load_modules.sh" ]; then
	1>&2 printf -- "%s" "\
E: 'runtimes/load_modules' -> ?!?!  <- Dev!!!

"
	return 1
fi

. "${XUANQI_DIRECTORY_ROOT}/interactors/libraries/runtimes/load_modules.sh"
command -v XUANQI_interactors_libraries_runtimes_load_modules \
	> /dev/null \
	2> /dev/null
if [ $? -ne 0 ]; then
	1>&2 printf -- "%s" "\
E: 'XUANQI_interactors_libraries_runtimes_load_modules' -> ?!?!  <- Dev!!!

"
	return 1
fi

XUANQI_interactors_libraries_runtimes_load_modules \
	"${XUANQI_DIRECTORY_ROOT}/entities"
XUANQI_interactors_libraries_runtimes_load_modules \
	"${XUANQI_DIRECTORY_ROOT}/views"
XUANQI_interactors_libraries_runtimes_load_modules \
	"${XUANQI_DIRECTORY_ROOT}/interactors"




# configure console colors
XUANQI_COLOR_MODE="$( \
	XUANQI_interactors_libraries_os_read_terminal_color_mode \
)"




# configure app metadata
XUANQI_VERSION="$(XUANQI_interactors_responses_trademarks_get_version)"
XUANQI_LICENSE="$(XUANQI_interactors_responses_trademarks_get_license)"
XUANQI_LANG="$(XUANQI_interactors_libraries_os_read_lang)"




# save XUANQI_DIRECTORY_PWD current directory
XUANQI_DIRECTORY_PWD="$PWD"




# locate XUANQI_DIRECTORY_PROJECT directory
XUANQI_DIRECTORY_PROJECT="$PWD"
while true; do
	if [ "$XUANQI_DIRECTORY_PROJECT" = "/" ]; then
		XUANQI_interactors_libraries_os_print_error "\
'\$XUANQI_DIRECTORY_PROJECT' -> ?!?!  <- Dev!!!

" "$XUANQI_COLOR_MODE"
		return 1
	elif [ -d "${XUANQI_DIRECTORY_PROJECT}/.git" ]; then
		break
	fi

	XUANQI_DIRECTORY_PROJECT="${XUANQI_DIRECTORY_PROJECT%/*}"
done




# execute by first parameter
case "${1:-}" in
-h|help|Help|HELP)
	. "${XUANQI_DIRECTORY_ROOT}/presenters/help/start.sh"
	return 0
	;;
license)
	. "${XUANQI_DIRECTORY_ROOT}/presenters/license/start.sh"
	return 0
	;;
version)
	. "${XUANQI_DIRECTORY_ROOT}/presenters/version/start.sh"
	return 0
	;;
*)
	XUANQI_interactors_libraries_os_print_error "\
'${1:-}' => ???
" "$XUANQI_COLOR_MODE"
	return 1
	;;
esac
