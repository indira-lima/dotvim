PackAdd EdenEast/nightfox.nvim

colorscheme duskfox
 
lua << EOF

require('nightfox').setup({
  options = {
		transparent = true,
	}
})

EOF

