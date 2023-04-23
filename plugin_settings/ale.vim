if !get(g:, 'loaded_ale', 0)
  finish
endif

nnoremap <silent> <M-f> :ALEFix<CR>

let g:ale_linters = {'javascript': ['eslint'],
      \ 'dart': ['analysis_server'],
      \ 'typescript': ['tsserver', 'eslint'],
      \ 'python': ['pyls', 'pylint'],
      \ 'typescriptreact': ['tsserver', 'eslint']}
let g:ale_fixers = {'javascript': ['eslint'],
      \ 'java': ['google_java_format'],
      \ 'typescript': ['eslint', 'prettier'],
      \ 'typescriptreact': ['eslint', 'prettier'],
      \ 'javascriptreact': ['eslint', 'prettier'],
      \ 'dart': ['dart-format'],
      \ 'python': ['black'],
      \ 'json': ['prettier']}

let g:ale_sign_column_always=1
let g:ale_fix_on_save=1
let g:ale_lint_delay=-1
let g:ale_virtualtext_cursor='disabled'
" let g:ale_completion_enabled=1

"let g:ale_dart_dartfmt_executable = '/Users/bashar/work/bin/flutter/bin/cache/dart-sdk/bin/dartfmt'
"let g:ale_dart_analysis_server_executable = '/Users/bashar/work/bin/flutter/bin/cache/dart-sdk/bin/dart'
"let g:dart_language_server_executable = '/Users/bashar/work/bin/flutter/bin/cache/dart-sdk/bin/snapshots/analysis_server.dart.snapshot'
