" Vim syntax file
" Language:        logcat
" Maintainer:      Gerry Hu <hgr3306@foxmail.com>
" Latest Revision: 2017-08-07

if exists("b:current_syntax")
    finish
endif

syn match logcatLogE  "\(^.*\sE\s\S\+\s*:\s.*$\)\|\(^.*\s\?E\/\S\+\s*(\(\s\|\d\)\+):\s.*$\)"
syn match logcatLogV  "\(^.*\sV\s\S\+\s*:\s.*$\)\|\(^.*\s\?V\/\S\+\s*(\(\s\|\d\)\+):\s.*$\)"
syn match logcatLogD  "\(^.*\sD\s\S\+\s*:\s.*$\)\|\(^.*\s\?D\/\S\+\s*(\(\s\|\d\)\+):\s.*$\)"
syn match logcatLogI  "\(^.*\sI\s\S\+\s*:\s.*$\)\|\(^.*\s\?I\/\S\+\s*(\(\s\|\d\)\+):\s.*$\)"
syn match logcatLogW  "\(^.*\sW\s\S\+\s*:\s.*$\)\|\(^.*\s\?W\/\S\+\s*(\(\s\|\d\)\+):\s.*$\)"
syn match logcatLogA  "\(^.*\sA\s\S\+\s*:\s.*$\)\|\(^.*\s\?A\/\S\+\s*(\(\s\|\d\)\+):\s.*$\)"

hi def link logcatLogV Normal
hi def link logcatLogE Error
hi def link logcatLogD Directory
hi def link logcatLogI Question
hi def link logcatLogW Title
hi def link logcatLogA Todo
