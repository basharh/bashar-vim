if !exists('g:loaded_fzf_vim')
  finish
endif

if !exists('g:loaded_nerd_tree')
    finish
endif

" on nerdtree dir node: open FZF for directory
function! NERDTreeOpenFZF()
    let l:node = g:NERDTreeFileNode.GetSelected()

    if empty(l:node)
        return
    endif

    let l:path = l:node.path.str()

    if !isdirectory(l:path)
      let l:path = fnamemodify(l:path, ":h")
    endif

    execute "FZF " . l:path
endfunction

" on nerdtree dir node: grep directory
function! NERDTreeOpenGrep()
    let l:node = g:NERDTreeFileNode.GetSelected()

    if empty(l:node)
        return
    endif

    call fzf#vim#grep2("rg --column --line-number --no-heading --color=always --smart-case",
      \ "", fzf#vim#with_preview({'dir': l:node.path.str()}))
endfunction

" inside buffer: open FZF for directory
function! BufferOpenFZF()
  let l:buffer_git_path = finddir('.git/..', expand('%:p:h').';')

  if empty(l:buffer_git_path)
      return
  endif

  execute "FZF " . l:buffer_git_path
endfunction

" inside buffer: grep a git directory of the file
function! BufferOpenGrep(visual)
  "let l:buffer_git_path = fnamemodify(FugitiveGitDir(), ":h")
  let l:buffer_git_path = finddir('.git/..', expand('%:p:h').';')
  let l:search = ""

  if a:visual
    let temp = @@
    norm! gvy
    let l:search = @@
    let @@ = temp
  endif

  if empty(l:buffer_git_path)
      return
  endif

  call fzf#vim#grep2("rg --column --line-number --no-heading --color=always --smart-case", l:search,
    \ fzf#vim#with_preview({'dir': l:buffer_git_path}))
endfunction

" nerdtree mappings are defined in the filetype plugins
nnoremap <leader>zf :call BufferOpenFZF()<cr>
nnoremap <leader>zg :call BufferOpenGrep(0)<cr>
vnoremap <leader>zg :call BufferOpenGrep(1)<cr>
