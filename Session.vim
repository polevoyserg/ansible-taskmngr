let SessionLoad = 1
let s:so_save = &so | let s:siso_save = &siso | set so=0 siso=0
let v:this_session=expand("<sfile>:p")
silent only
cd /etc/ansible
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +4 roles/win_common/tasks/main.yml
badd +1 /var/tmp/chef/win_common/recipes/change_user_groups.rb
badd +1 /var/tmp/chef/win_common/recipes/default.rb
badd +5 /var/tmp/chef/win_common/recipes/enable_admin.rb
badd +1 /var/tmp/chef/win_common/recipes/inst_1cclient.rb
badd +1 /var/tmp/chef/win_common/recipes/inst_7z.rb
badd +1 /var/tmp/chef/win_common/recipes/inst_browsers.rb
badd +1 /var/tmp/chef/win_common/recipes/inst_drv_audio.rb
badd +1 /var/tmp/chef/win_common/recipes/inst_gimp.rb
badd +1 /var/tmp/chef/win_common/recipes/inst_libreoffice.rb
badd +1 /var/tmp/chef/win_common/recipes/inst_misc.rb
badd +1 /var/tmp/chef/win_common/recipes/inst_mpoint.rb
badd +1 /var/tmp/chef/win_common/recipes/inst_msoffice.rb
badd +1 /var/tmp/chef/win_common/recipes/inst_teamviewer.rb
badd +1 /var/tmp/chef/win_common/recipes/inst_telegram.rb
badd +1 /var/tmp/chef/win_common/recipes/inst_xlite.rb
badd +1 /var/tmp/chef/win_common/recipes/mount_misc.rb
badd +2 site.yml
badd +5 win.yml
badd +39 ~/.vimrc
badd +1 roles/win_common/tasks/get_1c_client.yml
badd +1 roles/win_common/tasks/get_7z.yml
badd +1 roles/win_common/tasks/get_browsers.yml
badd +1 roles/win_common/tasks/get_drv_audio.yml
badd +1 roles/win_common/tasks/get_misc.yml
badd +1 roles/win_common/tasks/get_mpoint.yml
badd +1 roles/win_common/tasks/get_ms_office.yml
badd +1 roles/win_common/tasks/get_teamviewer.yml
badd +1 roles/win_common/tasks/get_telegram.yml
badd +1 roles/win_common/tasks/get_xlite.yml
badd +4 roles/win_common/tasks/set_admin.yml
badd +1 roles/win_common/tasks/set_users.yml
badd +7 roles/win_common/files/set_admin.ps1
badd +1 group_vars/all.yml
badd +3 group_vars/win.yml
argglobal
silent! argdel *
argadd roles/win_common/tasks/get_1c_client.yml
argadd roles/win_common/tasks/get_7z.yml
argadd roles/win_common/tasks/get_browsers.yml
argadd roles/win_common/tasks/get_drv_audio.yml
argadd roles/win_common/tasks/get_misc.yml
argadd roles/win_common/tasks/get_mpoint.yml
argadd roles/win_common/tasks/get_ms_office.yml
argadd roles/win_common/tasks/get_teamviewer.yml
argadd roles/win_common/tasks/get_telegram.yml
argadd roles/win_common/tasks/get_xlite.yml
argadd roles/win_common/tasks/main.yml
argadd roles/win_common/tasks/set_admin.yml
argadd roles/win_common/tasks/set_users.yml
edit roles/win_common/tasks/set_admin.yml
set splitbelow splitright
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd w
set nosplitbelow
set nosplitright
wincmd t
set winheight=1 winwidth=1
exe 'vert 1resize ' . ((&columns * 76 + 39) / 78)
exe 'vert 2resize ' . ((&columns * 1 + 39) / 78)
argglobal
13argu
edit roles/win_common/tasks/set_admin.yml
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let s:l = 4 - ((3 * winheight(0) + 6) / 13)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
4
normal! 0
wincmd w
argglobal
edit group_vars/win.yml
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let s:l = 1 - ((0 * winheight(0) + 6) / 13)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
1
normal! 0
wincmd w
exe 'vert 1resize ' . ((&columns * 76 + 39) / 78)
exe 'vert 2resize ' . ((&columns * 1 + 39) / 78)
tabnext 1
if exists('s:wipebuf') && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20 shortmess=filnxtToOI
let s:sx = expand("<sfile>:p:r")."x.vim"
if file_readable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &so = s:so_save | let &siso = s:siso_save
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
