if exists("loaded_bashar")
  finish
endif

let loaded_bashar = 1

"augroup bashar
  ""load all bashar plugin parts after vim starts
  "autocmd VimEnter * runtime! bashar_parts/**/*.vim
  "autocmd VimEnter * runtime! plugin_settings/**/*.vim
"augroup END

runtime! bashar_parts/**/*.vim
runtime! plugin_settings/**/*.vim
