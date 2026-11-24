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
$null = Write-Host @"
I: Checking XuanQi's Usability...
"@
if (-not (Test-Path -Path ".\.internals\xuanqi\Start.sh.ps1" -PathType Leaf)) {
	$null = Write-Host @"
E: Execution Failed (file).
E: Are You At Repository's Root Directory?
E: Unable to Proceed.
E: Bailing Out...
"@
	$global:LASTEXITCODE = 1
	return
}




$null = Write-Host @"
I: Testing XuanQi's Help API...
"@
.\.internals\xuanqi\Start.sh.ps1 help
if ($LASTEXITCODE -ne 0) {
	$null = Write-Host @"
E: Execution Failed.
E: Unable to Proceed.
E: Bailing Out...
"@
	$global:LASTEXITCODE = 1
	return
}




$null = Write-Host @"
I: Testing XuanQi's License Help API...
"@
.\.internals\xuanqi\Start.sh.ps1 help license
if ($LASTEXITCODE -ne 0) {
	$null = Write-Host @"
E: Execution Failed.
E: Unable to Proceed.
E: Bailing Out...
"@
	$global:LASTEXITCODE = 1
	return
}




$null = Write-Host @"
I: Testing XuanQi's Version Help API...
"@
.\.internals\xuanqi\Start.sh.ps1 help version
if ($LASTEXITCODE -ne 0) {
	$null = Write-Host @"
E: Execution Failed.
E: Unable to Proceed.
E: Bailing Out...
"@
	$global:LASTEXITCODE = 1
	return
}




$null = Write-Host @"
I: Testing XuanQi's Version API...
"@
$_version = .\.internals\xuanqi\Start.sh.ps1 version
$null = Write-Host @"
I: Got '${_version}'
"@
if ([string]::IsNullOrEmpty($_version)) {
	$null = Write-Host @"
E: Execution Failed.
E: Unable to Proceed.
E: Bailing Out...
"@
	$global:LASTEXITCODE = 1
	return
}
$null = Remove-Variable -ErrorAction SilentlyContinue -Name _version




$null = Write-Host @"
I: Testing XuanQi's License API...
"@
$_license = .\.internals\xuanqi\Start.sh.ps1 license
$null = Write-Host @"
I: Got '${_license}'
"@
if ([string]::IsNullOrEmpty($_license)) {
	$null = Write-Host @"
E: Execution Failed.
E: Unable to Proceed.
E: Bailing Out...
"@
	$global:LASTEXITCODE = 1
	return
}
$null = Remove-Variable -ErrorAction SilentlyContinue -Name _license




# report status
$global:LASTEXITCODE = 0
return
