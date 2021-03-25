# this script will generate the local workspace

$workspace = Join-Path -Path $PSScriptRoot -ChildPath "workspace"
New-Item -Type Directory -Force $workspace

function Add-SparseClone {
    param (
        [Parameter(Mandatory)]
        [string]$Target,               # name of directory to create under workspace

        [Parameter(Mandatory)]
        [string]$Repository,           # remote to clone

        [Parameter(Mandatory)]
        [string]$SparseKey,            # git sparse checkout argument - i.e. parts of the tree to checkout

        [string]$Branch = "master"     # optional branch to checkout

    )


    $fullTarget = Join-Path $workspace $Target

    if ( -not (Test-Path $fullTarget))
    {
        Write-Output "Processing  $Target"
        Write-Output "Creating local copy of $Target docs"
        Set-Location $workspace
        git clone --filter=blob:none --no-checkout $Repository $Target
        Set-Location $Target
        git sparse-checkout init --cone
        git sparse-checkout set $SparseKey
        git checkout $Branch
        Set-Location ../..
    } 
    else 
    {
        Write-Output "Skipping $workspace\$Target as it exists"
    }

}


Add-SparseClone -Target "bi"  -Repository "git@github.com:ssatuk/docs.src.bi.git" -SparseKey "tech"
Add-SparseClone -Target "docmetatech" -Repository "git@github.com:ssatuk/docs.src.documentation.git" -SparseKey "tech"
Add-SparseClone -Target "flows" -Repository "git@bitbucket.org:ssat/ssat.flows.team.git -SparseKey "docs/tech"
Add-SparseClone -Target "learn" -Repository "git@github.com:ssatuk/docs.src.learn.git -SparseKey "tech"
Add-SparseClone -Target "learn-tf" -Repository "git@github.com:ssatuk/terraform-do-learn.git -SparseKey "docs"
Add-SparseClone -Target "ma" -Repository "git@github.com:ssatuk/SSAT.EAI.MarketingAutomation.git -SparseKey "doc"
Add-SparseClone -Target "processes" -Repository "git@github.com:ssatuk/docs.src.processes.git -SparseKey "tech"
Add-SparseClone -Target "ssat.xrm.apps.tm" -Repository "git@bitbucket.org:ssat/ssat.xrm.apps.tm.git -SparseKey "docs/tech"
Add-SparseClone -Target "web" -Repository "https://ssatgitbot:tb4wBa5mZ9ScLcrrzXt6@bitbucket.org/ssat/ssat.web.master.git  -SparseKey "docs" -Branch "docs"
Add-SparseClone -Target "xrm2xero" -Repository "git@github.com:ssatuk/Xrm2Xero.git -SparseKey "doc"
Add-SparseClone -Target "ssat.xrm.code.membership" -Repository "git@bitbucket.org:ssat/ssat.xrm.code.membership.git"  -SparseKey "docs/tech"
Add-SparseClone -Target "ssat.xrm.code.general" -Repository "git@bitbucket.org:ssat/ssat.xrm.code.general.git" -SparseKey "docs/tech" 
