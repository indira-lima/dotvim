PackAdd Exafunction/codeium.vim

" disable default bindings
let g:codeium_disable_bindings = 1

" define my own bindings
imap <script><silent><nowait><expr> <C-v> codeium#Accept()
imap <C-;>   <Cmd>call codeium#CycleCompletions(1)<CR>
imap <C-,>   <Cmd>call codeium#CycleCompletions(-1)<CR>
imap <C-c>   <Cmd>call codeium#Clear()<CR>

set statusline+=\{…\}%3{codeium#GetStatusString()}
