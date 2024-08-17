if exists("loaded_bashar_flutter")
  finish
endif
let loaded_bashar_flutter = 1

nmap <leader>fs :FlutterRun<CR>
nmap <leader>fr :FlutterHotRestart<CR>
nmap <leader>fd :FlutterVisualDebug<CR>
nmap <leader>fq :FlutterQuit<CR>
