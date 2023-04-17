if exists("loaded_bashar_win_shorts")
  finish
endif
let loaded_bashar_win_shorts = 1

nnoremap <leader>w+ :<c-u>call <SID>ChangeWinSize(<c-r>=v:count<cr>, 1, 1)<cr>
nnoremap <leader>w- :<c-u>call <SID>ChangeWinSize(<c-r>=v:count<cr>, 1, 0)<cr>
nnoremap <leader>v+ :<c-u>call <SID>ChangeWinSize(<c-r>=v:count<cr>, 0, 1)<cr>
nnoremap <leader>v- :<c-u>call <SID>ChangeWinSize(<c-r>=v:count<cr>, 0, 0)<cr>
nnoremap <leader>wo :<c-u>only<cr>

nnoremap <leader>wP :<c-u>execute "normal \<lt>c-w>P"<cr>
nnoremap <leader>wt :<c-u>execute "normal \<lt>c-w>T"<cr>

nmap <M-p> :<c-u>bprevious<cr>
nmap <M-n> :<c-u>bnext<cr>
nmap <M-3> :<c-u>e #<cr>

function! s:ChangeWinSize(count, hor, inc)
  if ( ! a:count )
    let l:count = 10
  else
    let l:count = a:count
  endif

  if ( a:hor && a:inc ) " Increase Horizontal
    execute "resize +" . string(l:count)
  elseif ( a:hor && !a:inc ) " Decrease Horizontal
    execute "resize -" . string(l:count)
  elseif ( !a:hor && a:inc ) " Increase Vertical
    execute "vertical resize +" . string(l:count)
  elseif ( !a:hor && !a:inc ) " Decrease Vertical
    execute "vertical resize -" . string(l:count)
  endif
endfunction

nnoremap <silent> <M-k> :wincmd k<CR>
nnoremap <silent> <M-j> :wincmd j<CR>
nnoremap <silent> <M-h> :wincmd h<CR>
nnoremap <silent> <M-l> :wincmd l<CR>

nnoremap <silent> <leader>w= :wincmd =<CR>
nnoremap <silent> <leader>v= :wincmd =<CR>
"
"Leave the old win navs behind
map <c-w>h <nop>
map <c-w>j <nop>
map <c-w>k <nop>
map <c-w>l <nop>

nnoremap <leader>sv :vertical split<cr>
nnoremap <leader>sh :split<cr>
nnoremap <leader>ev :split $MYVIMRC<cr>
nnoremap <leader>em :split ~/work/worklog.markdown<cr>
nnoremap <leader>et :split ~/TODO.markdown<cr>
