if !get(g:, 'loaded_airline', 0)
  finish
endif

let g:airline_section_a = ''
let g:airline_section_y = ''
let g:airline_section_z = '%l/%L, %v'
let g:airline_section_x = ''
let g:airline_focuslost_inactive = 0
let g:airline_inactive_collapse = 0

let g:airline#extensions#tabline#enabled = 0
let g:airline#extensions#tabline#show_splits = 1

AirlineTheme dark_minimal
