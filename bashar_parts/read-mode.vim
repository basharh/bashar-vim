if exists("loaded_bashar_read_mode")
  finish
endif
"let loaded_bashar_read_mode = 1

nnoremap <leader>r :call <SID>ToggleReadMode()<cr>

function! s:ToggleReadMode()

  if ( !exists("b:originally_modifiable") )
    let b:originally_modifiable = &modifiable
  endif

  if( exists("b:read_mode") && b:read_mode ) " read_mode currently ON
    "set guicursor&
    "set guicursor+=n-v-c:blinkon0
    if ( b:originally_modifiable )
      setlocal modifiable
    endif
    let b:read_mode = 0
    call s:RestorePreReadModeKeys()
    setlocal scrolloff<
    setlocal scroll=0
    call s:ShowCursor()
    return
  endif

  " read_mode currently OFF
  setlocal scrolloff=999
  setlocal scroll=5
  "set guicursor=n:blinkwait0-blinkon0-blinkoff0-ver1-hor1-hiddenCursor
  if ( b:originally_modifiable )
    setlocal nomodifiable
  endif
  let b:read_mode = 1
  call s:MapReadModeKeys()
  call s:HideCursor()
endfunction

function! s:MapReadModeKeys()

  let b:save_j_map = maparg("j", "n")
  let b:save_k_map = maparg("k", "n")
  let b:save_d_map = maparg("d", "n")
  let b:save_u_map = maparg("u", "n")

  nnoremap <buffer> j  
  nnoremap <buffer> k  
  nnoremap <buffer> d  
  nnoremap <buffer> u  
endfunction

function! s:RestorePreReadModeKeys()

  nunmap <buffer> j
  nunmap <buffer> k
  nunmap <buffer> d
  nunmap <buffer> u

  if ( b:save_j_map =~# '\v\S' )
    execute "nmap <buffer> j " . b:save_j_map
  endif

  if ( b:save_k_map =~# '\v\S' ) " If save_k_map is empty string
    execute "nmap <buffer> k " . b:save_k_map
  endif

  if ( b:save_d_map =~# '\v\S' ) " If save_d_map is empty string
    execute "nmap <buffer> d " . b:save_d_map
  endif

  if ( b:save_u_map =~# '\v\S' ) " If save_u_map is empty string
    execute "nmap <buffer> u " . b:save_u_map
  endif
endfunction

function s:HideCursor()
  set guicursor=n:blinkwait0-blinkon0-blinkoff0-ver1-hor1-hiddenCursor
endfunction

function s:ShowCursor()
  set guicursor&
  set guicursor+=n-v-c:blinkon0
endfunction

function s:SetCursor()
  if ( !exists("b:read_mode") )
    let b:read_mode = 0
  end

  if ( b:read_mode )
    call s:HideCursor()
  else
    call s:ShowCursor()
  endif
endfunction

augroup bashar_read_mode
  autocmd!
  autocmd BufEnter * call s:SetCursor()
augroup END
