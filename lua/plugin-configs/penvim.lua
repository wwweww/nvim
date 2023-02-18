require("penvim").setup({
	rooter = {
		enable = true, -- enable/disable rooter
		patterns = {'.__nvim__.lua', '.git', 'node_modules'}
	},
	indentor = {
		enable = true, -- enable/disable indentor
		indent_length = 4, -- tab indent width
		accuracy = 5, -- positive integer. higher the number, the more accurate result (but affects the startup time)
		disable_types = {
			'help','dashboard','dashpreview','NvimTree','vista','sagahover', 'terminal',
		},
	},
	project_env = {
		enable = true, -- enable/disable project_env
		config_name = '.__nvim__.lua' -- config file name
	},
	-- for all file types
	all = {
		tabstop = 4, -- spaces per tab
		cursorline = true, -- highlight current line
		relativenumber = true, -- show relative line number
		number = true, -- show line numbers
	},

	-- for filetype lua
	lua = {	
		smarttab = true, -- <tab>/<BS> indent/dedent in leading whitespace
		softtabstop = 4,
		shiftwidth = 4, -- spaces per tab (when shifting), when using the >> or << commands, shift lines by 4 spaces
	},
	
	-- for filetype python and javascript
	py_js = {
		tabstop = 4, -- spaces per tab
		wrap = false, -- don't automatically wrap on load
	}
})
