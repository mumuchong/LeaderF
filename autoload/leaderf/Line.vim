" ============================================================================
" File:        Line.vim
" Description:
" Author:      Yggdroot <archofortune@gmail.com>
" Website:     https://github.com/Yggdroot
" Note:
" License:     Apache License, Version 2.0
" ============================================================================

if leaderf#versionCheck() == 0  " this check is necessary
    finish
endif

exec g:Lf_py "from leaderf.lineExpl import *"

function! leaderf#Line#Maps()
    nmapclear <buffer>
    nnoremap <buffer> <silent> <CR>          :exec g:Lf_py "lineExplManager.accept()"<CR>
    nnoremap <buffer> <silent> o             :exec g:Lf_py "lineExplManager.accept()"<CR>
    nnoremap <buffer> <silent> <2-LeftMouse> :exec g:Lf_py "lineExplManager.accept()"<CR>
    nnoremap <buffer> <silent> x             :exec g:Lf_py "lineExplManager.accept('h')"<CR>
    nnoremap <buffer> <silent> v             :exec g:Lf_py "lineExplManager.accept('v')"<CR>
    nnoremap <buffer> <silent> t             :exec g:Lf_py "lineExplManager.accept('t')"<CR>
    nnoremap <buffer> <silent> q             :exec g:Lf_py "lineExplManager.quit()"<CR>
    nnoremap <buffer> <silent> <Esc>         :exec g:Lf_py "lineExplManager.quit()"<CR>
    nnoremap <buffer> <silent> i             :exec g:Lf_py "lineExplManager.input()"<CR>
    nnoremap <buffer> <silent> <Tab>         :exec g:Lf_py "lineExplManager.input()"<CR>
    nnoremap <buffer> <silent> <F1>          :exec g:Lf_py "lineExplManager.toggleHelp()"<CR>
    if has_key(g:Lf_NormalMap, "Line")
        for i in g:Lf_NormalMap["Line"]
            exec 'nnoremap <buffer> <silent> '.i[0].' '.i[1]
        endfor
    endif
endfunction

function! leaderf#Line#startExpl(win_pos, ...)
    if a:0 == 0
        call leaderf#LfPy("lineExplManager.startExplorer('".a:win_pos."')")
    else
        call leaderf#LfPy("lineExplManager.startExplorer('".a:win_pos."', options=['--all'])")
    endif
endfunction

function! leaderf#Line#startExplPattern(win_pos, all, pattern)
    if a:all == 0
        call leaderf#LfPy("lineExplManager.startExplorer('".a:win_pos."', pattern='".a:pattern."')")
    else
        call leaderf#LfPy("lineExplManager.startExplorer('".a:win_pos."', options=['--all'], pattern='".a:pattern."')")
    endif
endfunction
