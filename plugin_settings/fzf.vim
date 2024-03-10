"if !exists('g:loaded_fzf_vim')
  "finish
"endif

command! -bang -nargs=* GGrep
  \ call fzf#vim#grep(
  \   'git grep --line-number -- '.shellescape(<q-args>), 0,
  \   fzf#vim#with_preview({'dir': systemlist('git rev-parse --show-toplevel')[0]}), <bang>0)

command! -bang -bar -nargs=? -complete=dir Cd
  \ call fzf#run(fzf#wrap(
  \ {'source': 'fd -H --glob -t d -d 4 ".git" '
  \ . ( empty("<args>") ? ( <bang>0 ? "~" : "." ) : "<args>" )
  \ . ' | xargs dirname',
  \ 'sink': 'e'}))

"command! -bang -bar -nargs=? -complete=dir Cd
  "\ call fzf#run(fzf#wrap(
  "\ {'source': 'find '
  "\ .( empty("<args>") ? ( <bang>0 ? "~" : "." ) : "<args>" )
  "\ ." -path 'tools' -prune -depth 3 -type d -exec test -e '{}'/.git \\; -print",
  "\ 'sink': 'e'}))

nnoremap <leader>zd :Cd ~/work<cr>
