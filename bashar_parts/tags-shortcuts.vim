
" disable this plugin, I don't use tags or at least I'm not using them properly
finish


if exists("loaded_bashar_tags_shorts")
  finish
endif

let loaded_bashar_tags_shorts = 1

nnoremap <c-f> :tnext<cr>
nnoremap <c-b> :tprevious<cr>

nnoremap <leader>tc :tselect<cr>
