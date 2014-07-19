" =============================================================
" FILE: gzoom.vim
" TITLE: Zoom Control for gvim
" AUTHOR: Apo11oH
" LICENCE: MIT License "{{{
"     Permission is hereby granted, free of charge, to any person obtaining
"     a copy of this software and associated documentation files (the
"     "Software"), to deal in the Software without restriction, including
"     without limitation the rights to use, copy, modify, merge, publish,
"     distribute, sublicense, and/or sell copies of the Software, and to
"     permit persons to whom the Software is furnished to do so, subject to
"     the following conditions:
"
"     The above copyright notice and this permission notice shall be included
"     in all copies or substantial portions of the Software.
"
"     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
"     OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
"     MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
"     IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
"     CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
"     TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
"     SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE. }}}"
" =============================================================

if exists("g:zoom_loaded")
    finish
endif

" Store current user settings
let s:current_cpo = &cpo
set cpo&vim

" Grab the current gui settings
let s:current_gsettings = &guifont

" Command mode commands
command! -narg=0 GZoomIn    :call s:GZoomIn()
command! -narg=0 GZoomOut   :call s:GZoomOut()
command! -narg=0 GZoomReset :call s:GZoomReset()

" Map keys
nnoremap + :GZoomIn<CR>
nnoremap - :GZoomOut<CR>
nnoremap <Leader>= :GZoomReset<CR>

" Increment font size "{{{
function! s:GZoomIn()
    let l:fsize = substitute(&guifont, '^.*:h\([^:]*\).*$', '\1','')
    let l:fsize += 1
    let l:newguifont = substitute(&guifont, ':h\([^:]*\)', ':h' . l:fsize, '')
    let &guifont = l:newguifont
endfunction }}}"

" Decrement font size "{{{
function! s:GZoomOut()
    let l:fsize = substitute(&guifont, '^.*:h\([^:]*\).*$', '\1','')
    let l:fsize -= 1
    let l:newguifont = substitute(&guifont, ':h\([^:]*\)', ':h' . l:fsize, '')
    let &guifont = l:newguifont
endfunction }}}"

" Reset font size "{{{
function! s:GZoomReset()
    let &guifont = s:current_gsettings
endfunction }}}"

let g:zoom_loaded = 1

" Restore current user settings
let &cpo = s:current_cpo
unlet s:current_cpo

" vim: foldmethod=marker
