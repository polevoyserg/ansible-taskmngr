if (-not (Get-Module -Name localaccount)) {
    Install-Module localaccount -Force
}

$en_name = "Administrator"
$ru_name = "Администратор"
$secure_pass = ConvertTo-SecureString -AsPlainText '7oYR26' -Force

$admin = Get-LocalUser | Where Name -Match "($en_name)|($ru_name)"

# WORKAROUND
# enable-localuser just toggles active state (bug), with this we make sure
# that if the account enabled already it remains so
Disable-LocalUser $admin.Name
Enable-LocalUser $admin.Name

If ($admin.Name -like "$ru_name") {
    Rename-LocalUser -Name $admin.Name -NewName $en_name
}

Set-LocalUser $en_name -Password $secure_pass
