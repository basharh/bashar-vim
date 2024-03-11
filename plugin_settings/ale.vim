if !get(g:, 'loaded_ale', 0)
  finish
endif

let g:ale_linters = {'javascript': ['eslint'],
      \ 'python': ['pyls', 'pylint']}
let g:ale_fixers = {'javascript': ['eslint'],
      \ 'java': ['google_java_format'],
      \ 'javascriptreact': ['eslint', 'prettier'],
      \ 'dart': ['dart-format'],
      \ 'css': ['prettier', 'eslint'],
      \ 'json': ['prettier'],
      \ 'graphql': ['prettier'],
      \ 'prisma': ['prettier'],
      \ 'typescript': ['eslint', 'prettier'],
      \ 'typescriptreact': ['eslint', 'prettier'],
      \ 'python': ['black'],
      \ 'json': ['prettier']}

let g:ale_sign_column_always=1
let g:ale_fix_on_save=1
let g:ale_lint_delay=-1
let g:ale_virtualtext_cursor='disabled'
let g:ale_linters_explicit = 1
let g:ale_disable_lsp = 1
