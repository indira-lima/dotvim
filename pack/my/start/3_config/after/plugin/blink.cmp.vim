finish

PackAdd nvim-lua/plenary.nvim

PackAdd hrsh7th/nvim-cmp
PackAdd neovim/nvim-lspconfig
PackAdd hrsh7th/cmp-nvim-lsp
PackAdd hrsh7th/cmp-buffer
PackAdd hrsh7th/cmp-path
PackAdd hrsh7th/cmp-cmdline
PackAdd petertriho/cmp-git
" PackAdd amago324/cmp-zsh
PackAdd saghen/blink.cmp
" For ultisnips users.
PackAdd SirVer/ultisnips
PackAdd quangnguyen30192/cmp-nvim-ultisnips
PackAdd hrsh7th/nvim-cmp

PackAdd Exafunction/windsurf.nvim

lua << EOF

local cmp = require'cmp'

cmp.setup({
	snippet = {
		expand = function(args)
		vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
		end,
	},
	mapping = {
		['<C-d>'] = cmp.mapping.scroll_docs(-4),
		['<C-u>'] = cmp.mapping.scroll_docs(4),
		['<C-Space>'] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping.abort(),
		['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
	},
	sources = {
		{ name = 'ultisnips' },
		{ name = 'buffer' },
		{ name = 'path' },
		{ name = 'nvim_lsp' },
		{ name = 'nvim_lua' },
		{ name = 'zsh' },
		{ name = 'codeium' }
	}
})

require("blink.cmp").setup({
	sources = {
			default = { 'lsp', 'path', 'snippets', 'buffer', 'codeium' },
	},
	providers = {
			codeium = { name = 'Codeium', module = 'codeium.blink', async = true },
    },
})

cmp.setup.filetype('gitcommit', {
	sources = cmp.config.sources({
	{ name = 'git' },
	}, {
		{ name = 'buffer' },
	})
})

require("cmp_git").setup()

cmp.setup.cmdline({ '/', '?' }, {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = 'buffer' }
	}
})

cmp.setup.cmdline(':', {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = 'path' }
	}, {
		{ name = 'cmdline' }
	}),
	matching = { disallow_symbol_nonprefix_matching = false }
})

require('codeium').setup({
		enable_chat =  true,
		virtual_text =  {
			enabled =  true,
		}
})


EOF

