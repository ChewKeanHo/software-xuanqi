# Copyright 2026 The (Holloway) Chew, Kean Ho's XuanQi Project Team (https://doi.org/10.5281/zenodo.24331455)
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
if ([string]::IsNullOrEmpty(${env:XUANQI_DIRECTORY})) {
	$null = Write-Host @"
E: '`$XUANQI_DIRECTORY' -> ?!?!  <- Dev!!!

"@
	$global:LASTEXITCODE = 1
	return
} elseif (-not (${env:XUANQI_DIRECTORY} -match "init\.ps1$")) {
	$null = Write-Host @"
'`$XUANQI_DIRECTORY' -> ?!?!  <- Dev!!!

"@
	$global:LASTEXITCODE = 1
	return
} elseif (-not (Test-Path -PathType Leaf -LiteralPath ${env:XUANQI_DIRECTORY})) {
	$null = Write-Host @"
'`$XUANQI_DIRECTORY' -> ?!?!  <- Dev!!!

"@
	$global:LASTEXITCODE = 1
	return
}




# locate the XUANQI_DIRECTORY_ROOT App directory
${env:XUANQI_DIRECTORY_ROOT} = ${env:XUANQI_DIRECTORY} -replace 'init\.ps1$'
${env:XUANQI_DIRECTORY_ROOT} = ${env:XUANQI_DIRECTORY_ROOT} -replace '\\$'
${env:XUANQI_DIRECTORY_ROOT} = ${env:XUANQI_DIRECTORY_ROOT} -replace 'presenters$'
${env:XUANQI_DIRECTORY_ROOT} = ${env:XUANQI_DIRECTORY_ROOT} -replace '\\$'




# import libraries
if (-not (Test-Path -PathType Leaf `
	-LiteralPath "${env:XUANQI_DIRECTORY_ROOT}\interactors\libraries\runtimes\load_modules.ps1" `
)) {
	$null = Write-Host @"
E: 'runtimes\load_modules' -> ?!?!  <- Dev!!!

"@
	$global:LASTEXITCODE = 1
	return
}


$null = . "${env:XUANQI_DIRECTORY_ROOT}\interactors\libraries\runtimes\load_modules.ps1"
if (-not (Get-Command XUANQI_interactors_libraries_runtimes_load_modules `
		 -errorAction SilentlyContinue `
)) {
	$null = Write-Host @"
E: 'XUANQI_interactors_libraries_runtimes_load_modules' -> ?!?!  <- Dev!!!

"@
	$global:LASTEXITCODE = 1
	return
}

$null = . XUANQI_interactors_libraries_runtimes_load_modules `
	"${env:XUANQI_DIRECTORY_ROOT}\entities"
$null = . XUANQI_interactors_libraries_runtimes_load_modules `
	"${env:XUANQI_DIRECTORY_ROOT}\views"
$null = . XUANQI_interactors_libraries_runtimes_load_modules `
	"${env:XUANQI_DIRECTORY_ROOT}\interactors"




# configure console colors
${env:XUANQI_COLOR_MODE} = XUANQI_interactors_libraries_os_read_terminal_color_mode




# configure app metadata
${env:XUANQI_VERSION} = XUANQI_interactors_responses_trademarks_get_version
${env:XUANQI_LICENSE} = XUANQI_interactors_responses_trademarks_get_license
${env:XUANQI_LANG} = XUANQI_interactors_libraries_os_read_lang




# save XUANQI_DIRECTORY_PWD current directory
${env:XUANQI_DIRECTORY_PWD} = (Get-Location).Path




# locate XUANQI_DIRECTORY_PROJECT directory
${env:XUANQI_DIRECTORY_PROJECT} = (Get-Location).Path
while ($true) {
	if (
		${env:XUANQI_DIRECTORY_PROJECT} -eq `
			[System.IO.Path]::GetPathRoot(${env:XUANQI_DIRECTORY_PROJECT})
	) {
		$null = XUANQI_interactors_libraries_os_print_error  @"
'`$XUANQI_DIRECTORY_PROJECT' -> ?!?!  <- Dev!!!

"@ ${env:XUANQI_COLOR_MODE}
		$global:LASTEXITCODE = 1
		return
	} elseif (
		Test-Path -PathType Container `
			-LiteralPath "${env:XUANQI_DIRECTORY_PROJECT}\.git" `
	) {
		break
	}

	${env:XUANQI_DIRECTORY_PROJECT} = `
		Split-Path -Parent ${env:XUANQI_DIRECTORY_PROJECT}
}




# execute by first parameter
switch -CaseSensitive ($args[0]) {
{ $_ -in "-h", "help", "Help", "HELP" } {
	. "${env:XUANQI_DIRECTORY_ROOT}\presenters\help\start.ps1" @args
	return
} "license" {
	. "${env:XUANQI_DIRECTORY_ROOT}\presenters\license\start.ps1" @args
	return
} "version" {
	. "${env:XUANQI_DIRECTORY_ROOT}\presenters\version\start.ps1" @args
	return
} default {
	$null = XUANQI_interactors_libraries_os_print_error @"
'$($args[0])' => ???
"@ ${env:XUANQI_COLOR_MODE}
	$global:LASTEXITCODE = 1
	return
}}
