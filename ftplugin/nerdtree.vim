augroup mynerdtree
  autocmd!
  " autocmd BufEnter <buffer> :echom "I got into a NERDTREE"
augroup END

setlocal statusline+=\ [%{winnr()}]

nnoremap <leader>zf :call NERDTreeOpenFZF()<cr>
nnoremap <leader>zg :call GrepNERDTreeFZF()<cr>
