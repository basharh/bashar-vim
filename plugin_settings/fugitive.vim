if exists('g:loaded_fugitive')
  nnoremap <leader>gg :Git<CR>
  nnoremap <leader>ga :Git add %<CR>
  nnoremap <leader>gc :Git commit<CR>
  nnoremap <leader>gd :Gvdiffsplit<CR>
  nnoremap <leader>gs :Git status<CR>
  nnoremap <leader>gp :Git push<CR>
endif
