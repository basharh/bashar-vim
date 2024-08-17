function! s:GitGrep()
  let word = expand("<cword>")
  let files = system('git ls-files')
  let quoted = map(split(files, "\n"), 'fnameescape(v:val)')
  " let cmd = "vimgrep! " . word . " " . join(split(files, "\n"), " ")
  let cmd = "silent grep! " . word . " " . join(quoted, " ")
  execute cmd
endfunction

nnoremap <c-f> :call <SID>GitGrep()<CR>
