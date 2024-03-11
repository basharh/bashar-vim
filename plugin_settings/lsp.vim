if has('nvim')
  finish
endif

vim9script

var lspOpts = {
  autoHighlightDiags: true,
  showDiagOnStatusLine: true,
  usePopupInCodeAction: true,
}

autocmd User LspSetup call LspOptionsSet(lspOpts)

var lspServers = [
  {
    name: 'dart',
    filetype: ['dart'],
    path: '/Users/bashar/work/tools/flutter/bin/dart',
    args: ['language-server'],
    rootSearch: ['.git/']
  }
]

autocmd User LspSetup call LspAddServer(lspServers)

def OnLspBufferEnabled()
  echom "setting up lsp.vim"
  nmap <buffer> <leader>ld :LspGotoDefinition<CR>
  nmap <buffer> <leader>ls :LspSymbolSearch<CR>
  nmap <buffer> <leader>lr :LspShowReferences<CR>
  nmap <buffer> <leader>li :LspGotoImpl<CR>
  #nmap <buffer> <leader>lt <plug>(lsp-type-definition)<CR>
  nmap <buffer> <leader>lR :LspRename<CR>
  nmap <buffer> <leader>la :LspCodeAction<CR>
  nmap <buffer> <leader>ll :LspServer show status<CR>
  nmap <buffer> <M-n> :LspDiag next<CR>
  nmap <buffer> K :LspPeekDefinition<CR>
  #nmap <buffer> K :LspPeekTypeDef<CR>
  #nmap <buffer> <leader>lt :vertical LspTypeDefinition<cr>
  #nmap <buffer> <leader>lp <plug>(lsp-peek-definition)
  #nmap <buffer> <C-p> <plug>(lsp-peek-definition)
  nnoremap <C-]> :LspGotoDefinition<CR>
  set signcolumn=yes
enddef

augroup lsp_vim_install
  au!
  autocmd User LspAttached call OnLspBufferEnabled()
augroup END
