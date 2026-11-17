#!/bin/sh
# Copyright 2026 The Automaton Project Team (https://github.com/ChewKeanHo/software-automaton)
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
# Permission to use, copy, modify, and/or distribute this software for
# any purpose with or without fee is hereby granted.
#
# THE SOFTWARE IS PROVIDED “AS IS” AND THE AUTHOR DISCLAIMS ALL
# WARRANTIES WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES
# OF MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE
# FOR ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY
# DAMAGES WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN
# AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT
# OF OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.




# check XuanQi's health and status
1>&2 printf -- "%s" "\
I: Checking XuanQi's Usability...
"
if [ ! -x "./.internals/xuanqi/Start.sh.ps1" ]; then
	1>&2 printf -- "%s" "\
E: Execution Failed (file).
E: Are You At Repository's Root Directory?
E: Unable to Proceed.
E: Bailing Out...
"
	return 1
fi


./.internals/xuanqi/Start.sh.ps1 help
if [ $? -ne 0 ]; then
	1>&2 printf -- "%s" "\
E: Execution Failed (help).
E: Unable to Proceed.
E: Bailing Out...
"
	return 1
fi


_version="$(./.internals/xuanqi/Start.sh.ps1 version)"
if [ "$_version" = "" ]; then
	unset _version
	1>&2 printf -- "%s" "\
E: Execution Failed (version).
E: Unable to Proceed.
E: Bailing Out...
"
	return 1
fi


_license="$(./.internals/xuanqi/Start.sh.ps1 license)"
if [ "$_license" = "" ]; then
	unset _license
	1>&2 printf -- "%s" "\
E: Execution Failed (license).
E: Unable to Proceed.
E: Bailing Out...
"
	return 1
fi
unset _license




# report status
return 0
