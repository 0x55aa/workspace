" File: my-vim.vim
" Author: 0x55aa
" Version: 0.1
" Last Modified: 2016/06/01
" License: Free
"
"
if !has('python')
  echo "Error: Required vim compiled with +python"
  finish
endif


function! Main()
    let s:base_path = fnameescape(expand('<sfile>:p:h'))
    exec "pyfile" s:base_path . '/py/main.py'
endfunction

command! -nargs=0 Hw call Main()
