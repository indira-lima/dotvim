PackAdd junegunn/fzf
PackAdd junegunn/fzf.vim

" Open files explorer (fzf)
nmap <f2> :Files<cr>

" Open git files explorer (fzf)
nmap <c-e> :GitFiles<cr>

if g:enablenvim
	nmap <leader>F :Rg<cr>
endif


