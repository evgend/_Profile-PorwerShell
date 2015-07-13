function prompt	
{
    # about_Prompts http://technet.microsoft.com/en-us/library/hh847739.aspx
	#
	# Color
	if ($host.Name -like "PowerGUI*")
	{
		[string]$PromptColor = 'Black'
	}
	else
	{
		[string]$PromptColor = 'Green'
	}
    if (test-path variable:/PSDebugContext)
    {
        $DBG='[DBG]:'
    } 
    else 
    { 
        $DBG='' 
    } 
    if ($nestedpromptlevel -ge 1) { $arrow = '>>' }
	
	Write-Host ("PS $DBG[$env:COMPUTERNAME]" + " $PWD$arrow>" ) -nonewline -foregroundcolor $PromptColor
    return " "
}
if (Test-Path "$env:USERPROFILE\OneDrive\Documents\Работа\PowerShell_Scripts\Modules")
{
    $env:PSModulePath = $env:PSModulePath + ";$env:USERPROFILE\OneDrive\Documents\Работа\PowerShell_Scripts\Modules"
}
elseif (Test-Path "$env:SystemDrive\PS_Modules")
{
    $env:PSModulePath = $env:PSModulePath + ";$env:SystemDrive\PS_Modules"
}
elseif(Test-Path "J:\")
{
    $env:PSModulePath = $env:PSModulePath + ";J:\"
}