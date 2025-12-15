echo \" <<'RUN_AS_BATCH' >/dev/null ">NUL "\" \`" <#"
@ECHO OFF
REM LICENSE CLAUSES HERE
REM ----------------------------------------------------------------------------




REM ############################################################################
REM # Windows BATCH Codes                                                      #
REM ############################################################################
REM execute
IF EXIST "%CD%\.internals\XuanQi\App\presenters\start.ps1" (
        REM likely in root repository
        powershell ^
                -ExecutionPolicy Bypass ^
                -Command ^
                ". '%CD%\.internals\XuanQi\App\presenters\start.ps1'; exit `$LASTEXITCODE" ^
                %*
        EXIT /B %ERRORLEVEL%
)

IF EXIST "%CD%\App\presenters\start.ps1" (
        REM inside '.internals\XuanQi'
        powershell ^
                -ExecutionPolicy Bypass ^
                -Command ^
                ". '%CD%\App\presenters\start.ps1'; exit `$LASTEXITCODE" ^
                %*
        EXIT /B %ERRORLEVEL%
)

IF EXIST "%CD%\presenters\start.ps1" (
        REM inside '.internals\XuanQi\App'
        powershell ^
                -ExecutionPolicy Bypass ^
                -Command ^
                ". '%CD%\presenters\start.ps1'; exit `$LASTEXITCODE" ^
                %*
        EXIT /B %ERRORLEVEL%
)

IF EXIST "%PROGRAMFILES%\chewkeanho\xuanqi\presenters\start.ps1" (
        REM look for installed application
        powershell ^
                -ExecutionPolicy Bypass ^
                -Command ^
                ". '%PROGRAMFILES%\chewkeanho\xuanqi\presenters\start.ps1'; exit `$LASTEXITCODE" ^
                %*
        EXIT /B %ERRORLEVEL%
)




REM fail the default run
echo E: Failed to Locate Init File.
echo E: Contact Developer|Maintainer.
echo E: Bailing Out...
exit /b 1
REM ############################################################################
REM # Windows BATCH Codes                                                      #
REM ############################################################################
RUN_AS_BATCH
#> | Out-Null




echo \" <<'RUN_AS_POWERSHELL' >/dev/null # " | Out-Null
################################################################################
# Windows POWERSHELL Codes                                                     #
################################################################################
# execute
if (Test-Path "$(Get-Location)\.internals\XuanQi\App\presenters\start.ps1") {
        # likely in root repository
        $_process = . "$(Get-Location)\.internals\XuanQi\App\presenters\start.ps1" $args
        exit $_process
} elseif (Test-Path "$(Get-Location)\App\presenters\start.ps1") {
        # inside '.internals\XuanQi'
        $_process = . "$(Get-Location)\App\presenters\start.ps1" $args
        exit $_process
} elseif (Test-Path "$(Get-Location)\presenters\start.ps1") {
        # inside '.internals\XuanQi\App'
        $_process = . "$(Get-Location)\presenters\start.ps1" $args
        exit $_process
} elseif (Test-Path "${env:PROGRAMFILES}\chewkeanho\xuanqi\presenters\start.ps1") {
        # look for installed application
        $_process = . "${env:PROGRAMFILES}\chewkeanho\xuanqi\presenters\start.ps1" $args
        exit $_process
} else {
        # fail the default run
        $null = Write-Error @"
E: Failed to Locate Init File.
E: Contact Developer|Maintainer.
E: Bailing Out...

"@
}
################################################################################
# Windows POWERSHELL Codes                                                     #
################################################################################
exit 1
<#
RUN_AS_POWERSHELL




################################################################################
# Unix Main Codes                                                              #
################################################################################
# execute
if [ -f "${PWD}/.internals/XuanQi/App/presenters/start.sh" ]; then
        # likely in root repository
        . "${PWD}/.internals/XuanQi/App/presenters/start.sh" "$@"
        exit $?
elif [ -f "${PWD}/App/presenters/start.sh" ]; then
        # inside '.internals/XuanQi'
        . "${PWD}/App/presenters/start.sh" "$@"
        exit $?
elif [ -f "${PWD}/presenters/start.sh" ]; then
        # inside '.internals/XuanQi/App'
        . "${PWD}/presenters/start.sh" "$@"
        exit $?
elif [ -f "/usr/local/lib/chewkeanho/xuanqi/presenters/start.sh" ]; then
        # look for installed application
        . "/usr/local/lib/chewkeanho/xuanqi/presenters/start.sh" "$@"
        exit $?
else
        1>&2 printf "%s" "\
E: Failed to Locate Init File.
E: Contact Developer|Maintainer.
E: Bailing Out...

"
fi
################################################################################
# Unix Main Codes                                                              #
################################################################################
exit 1
#>
