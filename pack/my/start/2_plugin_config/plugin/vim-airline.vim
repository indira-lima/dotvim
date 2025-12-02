" Nice and clean status bar for vim
PackAdd vim-airline/vim-airline
PackAdd vim-airline/vim-airline-themes

let g:airline_theme='soda'

" set statusline^=%{coc#status()}
"
let g:airline#extensions#tabline#enabled = 1

" Show CoC status in statusline  
let g:airline#extensions#coc#show_coc_status = 1  
  
" Add timer to refresh statusline every 250ms for CoC updates  
if has('timers')  
  augroup AirlineCocAutoUpdate  
    autocmd!  
    autocmd VimEnter * let s:timer = timer_start(250, function('s:update_airline'), {'repeat': -1})  
  augroup END  
  
  function! s:update_airline(timer)  
    if exists('#airline')  
      call airline#update_statusline()  
    endif  
  endfunction  
endif
