" The best Git integration for vim!
PackAdd tpope/vim-fugitive

" Open Git Fugitive status
nmap <c-g> :Git<cr>

" Show commits
nmap <C-c> <Nop>
nmap <C-c> :Commits<cr>

if !g:enablenvim
	finish
endif

" Write file to git
nnoremap <silent> <leader>gw :Gwrite<CR>
