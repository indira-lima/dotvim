PackAdd Exafunction/codeium.vim

let g:codeium_enabled = 1

" disable default bindings
let g:codeium_disable_bindings = 1

" define my own bindings
imap <script><silent><nowait><expr> <C-v> codeium#Accept()
imap <C-l>   <Cmd>call codeium#CycleCompletions(1)<CR>
imap <C-h>   <Cmd>call codeium#CycleCompletions(-1)<CR>
imap <C-c>   <Cmd>call codeium#Clear()<CR>
imap <C-c>   <Cmd>call codeium#Clear()<CR>

function! g:ToggleCodeiumEnabled()
	if g:codeium_enabled
		let g:codeium_enabled = 0
		echo "Codeium disabled"
	else
		let g:codeium_enabled = 1
		echo "Codeium enabled"
	endif
endfunction

nmap <C-i>  <Cmd>call ToggleCodeiumEnabled()<CR>

" set statusline+=\{…\}%3{codeium#GetStatusString()}
