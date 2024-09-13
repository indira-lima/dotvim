" The best Git integration for vim!
PackAdd tpope/vim-fugitive

" Open Git Fugitive status
nmap <c-g> :call ToggleGitBuffer()<cr>

function! ToggleGitBuffer() abort
  for l:winnr in range(1, winnr('$'))
    if !empty(getwinvar(l:winnr, 'fugitive_status'))
      exe l:winnr 'close'
      return
    endif
  endfor
  keepalt Git
endfunction

" Show commits
nmap <C-c> <Nop>
nmap <C-c> :Commits<cr>

if !g:enablenvim
	finish
endif

" Write file to git
nnoremap <silent> <leader>gw :Gwrite<CR>
