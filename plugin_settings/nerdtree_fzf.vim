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

    execute "FZF " . l:node.path.str()
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
function! BufferOpenGrep()
  "let l:buffer_git_path = fnamemodify(FugitiveGitDir(), ":h")
  let l:buffer_git_path = finddir('.git/..', expand('%:p:h').';')

  if empty(l:buffer_git_path)
      return
  endif

  let query = input('grep: ')

  call fzf#vim#grep('git grep --line-number -- '.shellescape(query), fzf#vim#with_preview({'dir': l:buffer_git_path}))
endfunction

" nerdtree mappings are defined in the filetype plugins
nnoremap <leader>zf :call BufferOpenFZF()<cr>
nnoremap <leader>zg :call BufferOpenGrep()<cr>
