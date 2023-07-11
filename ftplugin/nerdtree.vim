augroup mynerdtree
  autocmd!
  " autocmd BufEnter <buffer> :echom "I got into a NERDTREE"
  "nnoremap <buffer> <leader>zf :call NERDTreeOpenFZF()<cr>
  "nnoremap <buffer> <leader>zg :call GrepNERDTreeFZF()<cr>
  autocmd filetype nerdtree nnoremap <buffer> <leader>zf :call NERDTreeOpenFZF()<cr>
  autocmd filetype nerdtree nnoremap <buffer> <leader>zg :call GrepNERDTreeFZF()<cr>e
augroup END

"setlocal statusline+=\ [%{winnr()}]

