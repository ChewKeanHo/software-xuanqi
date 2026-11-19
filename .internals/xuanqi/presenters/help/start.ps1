#requires -Version 5.1
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




# execute
switch -CaseSensitive ($args[1]) {
"license" {
	$null = . "${env:XUANQI_DIRECTORY_ROOT}\presenters\help\license\start.ps1" @args
	$global:LASTEXITCODE = 0
	return
} "version" {
	$null = . "${env:XUANQI_DIRECTORY_ROOT}\presenters\help\version\start.ps1" @args
	$global:LASTEXITCODE = 0
	return
} default {
	## trademark header
	$null = XUANQI_interactors_libraries_os_print_info @"
$(
	XUANQI_interactors_responses_trademarks_get_header `
		${env:XUANQI_VERSION} `
		${env:XUANQI_LICENSE}
)
"@ ${env:XUANQI_COLOR_MODE}


	## content by language
	switch -CaseSensitive (${env:XUANQI_LANG}) {
	default {
		# default to 'en'
		$null = XUANQI_interactors_libraries_os_print_info @"
$(
	XUANQI_interactors_libraries_encodings_text_read_file_with_license_header `
		"${env:XUANQI_DIRECTORY_ROOT}\entities\i18n\help\en.txt"
)

"@ ${env:XUANQI_COLOR_MODE}
	}}


	## list variables for self-check
	$null = XUANQI_interactors_libraries_os_print_info @"
XUANQI_DIRECTORY_PWD:
${env:XUANQI_DIRECTORY_PWD}

XUANQI_DIRECTORY_PROJECT:
${env:XUANQI_DIRECTORY_PROJECT}

XUANQI_DIRECTORY_ROOT:
${env:XUANQI_DIRECTORY_ROOT}

XUANQI_COLOR_MODE:
${env:XUANQI_COLOR_MODE}

XUANQI_LANG:
${env:XUANQI_LANG}
"@ ${env:XUANQI_COLOR_MODE}
}}




# report status
$global:LASTEXITCODE = 0
return 0
