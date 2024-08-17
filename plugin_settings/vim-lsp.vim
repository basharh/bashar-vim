"let g:lsp_diagnostics_float_cursor = 1
"let g:lsp_diagnostics_float_insert_mode_enabled = 1
let g:asyncomplete_auto_popup = 0
let g:asyncomplete_enable_for_all = 1
let g:lsp_async_completion = 1
let g:lsp_completion_documentation_enabled = 0
let g:lsp_diagnostics_echo_cursor = 1
let g:lsp_diagnostics_float_insert_mode_enabled = 0
let g:lsp_diagnostics_highlights_enabled = 0
let g:lsp_diagnostics_highlights_insert_mode_enabled = 0
let g:lsp_diagnostics_signs_error = {'text': '✗'}
let g:lsp_diagnostics_signs_warning = {'text': '‼'}
let g:lsp_diagnostics_virtual_text_align = "after"
let g:lsp_diagnostics_virtual_text_delay = 0
let g:lsp_diagnostics_virtual_text_enabled = 0
let g:lsp_document_code_action_signs_enabled = 0
let g:lsp_signature_help_enabled = 0
let g:lsp_use_native_client = 1
let g:vim_lsp_jump_to_first = 0

hi link LspErrorVirtualText CursorLineFold

au User lsp_setup call lsp#register_server({
		\ 'name': 'dart',
		\ 'cmd': ['dart', 'language-server'],
		\ 'allowlist': ['dart', '.test.dart'],
		\ })

au User lsp_setup call lsp#register_server({
		\ 'name': 'typescript',
		\ 'cmd': ['typescript-language-server', '--stdio'],
		\ 'allowlist': ['typescript', 'typescriptreact'],
		\ 'root_uri':{server_info->lsp#utils#path_to_uri(
		\	lsp#utils#find_nearest_parent_file_directory(
		\		lsp#utils#get_buffer_path(),
		\		['.git/']
		\	))},
		\ })

au User lsp_setup call lsp#register_server({
		\ 'name': 'tailwind',
		\ 'cmd': ['tailwindcss-language-server', '--stdio'],
		\ 'allowlist': ['typescriptreact'],
		\ 'root_uri':{server_info->lsp#utils#path_to_uri(
		\	lsp#utils#find_nearest_parent_file_directory(
		\		lsp#utils#get_buffer_path(),
		\		['.git/']
		\	))},
		\ })

au User lsp_setup call lsp#register_server({
		\ 'name': 'kotlin-language-server',
		\ 'cmd': ['kotlin-language-server'],
		\ 'allowlist': ['kt', 'kotlin'],
		\ 'root_uri':{server_info->lsp#utils#path_to_uri(
		\	lsp#utils#find_nearest_parent_file_directory(
		\		lsp#utils#get_buffer_path(),
		\		['.git/']
		\	))},
		\ })

"function! s:on_lsp_buffer_enabled() abort
    "setlocal omnifunc=lsp#complete
    "setlocal signcolumn=yes
    "if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
    "nmap <buffer> gd <plug>(lsp-definition)
    "nmap <buffer> gs <plug>(lsp-document-symbol-search)
    "nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
    "nmap <buffer> gr <plug>(lsp-references)
    "nmap <buffer> gi <plug>(lsp-implementation)
    "nmap <buffer> gt <plug>(lsp-type-definition)
    "nmap <buffer> <leader>rn <plug>(lsp-rename)
    "nmap <buffer> [g <plug>(lsp-previous-diagnostic)
    "nmap <buffer> ]g <plug>(lsp-next-diagnostic)
    "nmap <buffer> <M-n> <plug>(lsp-next-diagnostic)
    "nmap <buffer> K <plug>(lsp-hover)
    ""nnoremap <buffer> <expr><c-f> lsp#scroll(+4)
    ""nnoremap <buffer> <expr><c-d> lsp#scroll(-4)

    "let g:lsp_format_sync_timeout = 1000
    "autocmd! BufWritePre *.rs,*.go call execute('LspDocumentFormatSync')

    "" refer to doc to add more commands
"endfunction

function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
    "nmap <buffer> <leader>lt <plug>(lsp-type-definition)
    nmap <buffer> <C-]> <plug>(lsp-definition)
    nmap <buffer> <C-p> <plug>(lsp-peek-definition)
    nmap <buffer> <M-n> <plug>(lsp-next-diagnostic)
    nmap <buffer> <M-p> <plug>(lsp-previous-diagnostic)
    nmap <buffer> <leader>lR <plug>(lsp-rename)
    nmap <buffer> <leader>lS <plug>(lsp-workspace-symbol-search)
    nmap <buffer> <leader>la <plug>(lsp-code-action-float)
    nmap <buffer> <leader>ld <plug>(lsp-definition)
    nmap <buffer> <leader>li <plug>(lsp-implementation)
    nmap <buffer> <leader>ll <plug>(lsp-status)
    nmap <buffer> <leader>lp <plug>(lsp-peek-definition)
    nmap <buffer> <leader>lr <plug>(lsp-references)
    nmap <buffer> <leader>ls <plug>(lsp-document-symbol-search)
    nmap <buffer> <leader>le :LspDocumentDiagnostics<cr>
    nmap <buffer> <leader>lt :vertical LspTypeDefinition<cr>
    nmap <buffer> K <plug>(lsp-hover)

    let g:lsp_format_sync_timeout = 1000
    autocmd! BufWritePre * call execute('LspDocumentFormatSync')
    "autocmd BufWritePre <buffer> LspDocumentFormatSync
endfunction

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

