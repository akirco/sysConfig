
 # initial oh-my-posh themes
 oh-my-posh --init --shell pwsh --config "~\Documents\PowerShell\SHELL.json" | Invoke-Expression
 # initial scoop auto complete
 Import-Module "$($(Get-Item $(Get-Command scoop).Path).Directory.Parent.FullName)\modules\scoop-completion"
 
 # scoop search 
 Invoke-Expression (&scoop-search --hook)
 
 # docker 
 Import-Module posh-docker

 # initial terminal icons
 Import-Module Terminal-Icons
 
 Set-PSReadlineKeyHandler -Key DownArrow -ScriptBlock { Invoke-GuiCompletion }
 
 Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete
 
 Set-PSReadlineKeyHandler -Key UpArrow -Function HistorySearchBackward
 
 #Set-PSReadlineKeyHandler -Key DownArrow -Function HistorySearchForward
 
 Set-PSReadlineOption -PredictionSource History
 
 Set-PSReadlineOption -ShowToolTip
 
 # ls
 Set-Alias ll ls
 
 # scoop
 Set-Alias sco scoop
 
 # 清屏Ctrl+L
 Set-Alias c cls
 
 # kate
 Set-Alias k kate
 
 # 删除文件或目录
 Set-Alias t trash
 
 # 终端的播放器
 Set-Alias mpx mpxplay

 # nvim
 Set-Alias vm nvim
 
 # scoop search
 Set-Alias sos scoop-search
 
 # git
 Set-Alias lg lazygit
 
 # 打包网页到一个html
 Set-Alias mon monolith
 
 # 创建文件
 Set-Alias h touch
 
 # 终端的系统监视器
 Set-Alias n ntop  
 
 # 重命名
 Set-Alias f2 rnr
 
 # 二维码发送文件 
 Set-Alias qr qrcp
 
 #alias function
 function scoop_home {Start-Process -FilePath $(scoop prefix scoop)}

 function localdata {Start-Process -FilePath $env:userprofile\appdata\Local}

 function apps {
    $apps = scoop.ps1 export | ConvertFrom-Json
    foreach($item in $apps){
        $app_list = $apps.apps | Format-Table
        Write-Output $app_list
    }
 }

 # extras
 Enable-PoshTooltips
 Enable-PoshTransientPrompt


 #set init dim
 #$env:dim = $(scoop prefix dim)
 #[System.Environment]::SetEnvironmentVariable('dim',$env:dim,'User')
 #$Env:PATH += $env:dim+';'
 #[System.Environment]::SetEnvironmentVariable('path',$Env:PATH,'User')

