if !exists('g:loaded_fzf_vim')
  finish
endif

command! -bang -nargs=* GGrep
  \ call fzf#vim#grep(
  \   'git grep --line-number -- '.shellescape(<q-args>), 0,
  \   fzf#vim#with_preview({'dir': systemlist('git rev-parse --show-toplevel')[0]}), <bang>0)

nnoremap <leader>f :GFiles<CR>
nnoremap <leader>g :GGrep<CR>
