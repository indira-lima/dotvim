" Tabs, as understood by any other editor.

if !g:enablenvim
	finish
endif

PackAdd romgrk/barbar.nvim

""""""""""""""""""""""""""""""""""""""""
"""" Mappings
""""""""""""""""""""""""""""""""""""""""

" new tab
nnoremap <silent>    <leader>t :tabnew<CR>
" reopen last closed tab
nnoremap <silent>    <leader>T :e#<CR>

" close buffer
nnoremap <silent>    ZZ <Cmd>BufferClose<CR>

" Move to previous/next
nnoremap <silent>    <leader>[ <Cmd>BufferPrevious<CR>
nnoremap <silent>    <leader>] <Cmd>BufferNext<CR>

" Re-order to previous/next
nnoremap <silent>    <leader>{ <Cmd>BufferMovePrevious<CR>
nnoremap <silent>    <leader>} <Cmd>BufferMoveNext<CR>

" Goto buffer in position...
nnoremap <silent>    <leader>1 <Cmd>BufferGoto 1<CR>
nnoremap <silent>    <leader>2 <Cmd>BufferGoto 2<CR>
nnoremap <silent>    <leader>3 <Cmd>BufferGoto 3<CR>
nnoremap <silent>    <leader>4 <Cmd>BufferGoto 4<CR>
nnoremap <silent>    <leader>5 <Cmd>BufferGoto 5<CR>
nnoremap <silent>    <leader>6 <Cmd>BufferGoto 6<CR>
nnoremap <silent>    <leader>7 <Cmd>BufferGoto 7<CR>
nnoremap <silent>    <leader>8 <Cmd>BufferGoto 8<CR>
nnoremap <silent>    <leader>9 <Cmd>BufferGoto 9<CR>
nnoremap <silent>    <leader>0 <Cmd>BufferLast<CR>

" Magic buffer-picking mode
nnoremap <silent>		 <leader>p <Cmd>BufferPick<CR>

""""""""""""""""""""""""""""""""""""""""
"""" Options
""""""""""""""""""""""""""""""""""""""""

let g:barbar_auto_setup = v:false " disable auto-setup
lua << EOF

-- enable saving tabnames in the sessions
vim.opt.sessionoptions:append 'globals'
require'barbar'.setup {
	animation = true,

	-- Enable/disable auto-hiding the tab bar when there is a single buffer
	auto_hide = false,

	-- Enable/disable current/total tabpages indicator (top right corner)
	tabpages = true,

  -- Enables/disable clickable tabs
  --  - left-click: go to buffer
  --  - middle-click: delete buffer
  clickable = true,

	-- Excludes buffers from the tabline
  exclude_ft = {'fugitive'},
  exclude_name = {'/usr/bin/zsh', 'nvim'},

  -- A buffer to this direction will be focused (if it exists) when closing the current buffer.
  -- Valid options are 'left' (the default), 'previous', and 'right'
  focus_on_close = 'previous',
	
  -- Hide inactive buffers and file extensions. Other options are `alternate`, `current`, and `visible`.
  hide = {extensions = current, inactive = visible},

  -- Disable highlighting alternate buffers
  highlight_alternate = true,

  -- Disable highlighting file icons in inactive buffers
  highlight_inactive_file_icons = true,

  -- Enable highlighting visible buffers
  highlight_visible = true,

	icons = {
    -- Configure the base icons on the bufferline.
    -- Valid options to display the buffer index and -number are `true`, 'superscript' and 'subscript'
    buffer_index = true,
    buffer_number = false,
    button = '',
    -- Enables / disables diagnostic symbols
    diagnostics = {
      [vim.diagnostic.severity.ERROR] = {enabled = true, icon = 'ﬀ'},
      [vim.diagnostic.severity.WARN] = {enabled = false},
      [vim.diagnostic.severity.INFO] = {enabled = false},
      [vim.diagnostic.severity.HINT] = {enabled = true},
    },
    gitsigns = {
      added = {enabled = true, icon = '+'},
      changed = {enabled = true, icon = '~'},
      deleted = {enabled = true, icon = '-'},
    },
    filetype = {
      -- Sets the icon's highlight group.
      -- If false, will use nvim-web-devicons colors
      custom_colors = false,

      -- Requires `nvim-web-devicons` if `true`
      enabled = true,
    },
    separator = {left = '|', right = ''},

    -- If true, add an additional separator at the end of the buffer list
    separator_at_end = true,

    -- Configure the icons on the bufferline when modified or pinned.
    -- Supports all the base icon options.
    modified = {button = '●'},

    -- Use a preconfigured buffer appearance— can be 'default', 'powerline', or 'slanted'
    preset = 'default',
  },

	-- Sets the maximum padding width with which to surround each tab
  maximum_padding = 1,

  -- Sets the minimum padding width with which to surroundound each tab
  minimum_padding = 1,

  -- Sets the maximum buffer name length.
  maximum_length = 30,

  -- Sets the minimum buffer name length.
  minimum_length = 10,

  -- New buffer letters are assigned in this order. This order is
  -- optimal for the qwerty keyboard layout but might need adjustment
  -- for other layouts.
	semantic_letters = true,
  letters = 'asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERUTYQP',

  -- Sets the name of unnamed buffers. By default format is "[Buffer X]"
  -- where X is the buffer number. But only a static string is accepted here.
  no_name_title = '~void~',

	  -- Set the filetypes which barbar will offset itself for
  sidebar_filetypes = {
    NvimTree = true,
  },
}
EOF
