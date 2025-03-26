" The best Git integration for vim!
PackAdd tpope/vim-fugitive

" Open Git Fugitive status
nmap <c-g> :call ToggleGitBuffer()<cr>

function! ToggleGitBuffer() abort
  try
    for l:winnr in range(1, winnr('$'))
      if !empty(getwinvar(l:winnr, 'fugitive_status'))
        " If this is the last window and it's not the only window
        if winnr('$') > 1
          exe l:winnr 'close'
        else
          " Create a new empty buffer before closing git status
          new
          wincmd p
          exe l:winnr 'close'
        endif
        return
      endif
    endfor
    keepalt Git
  catch /E855:/
    " Handle autocommand abort error silently
    return
  catch /.*/
    echohl ErrorMsg
    echo "Error in ToggleGitBuffer: " . v:exception
    echohl None
  endtry
endfunction

" Show commits
nmap <C-c> <Nop>
nmap <C-c> :Commits<cr>

if !g:enablenvim
	finish
endif

" Write file to git
nnoremap <silent> <leader>gw :Gwrite<CR>
