return {
	 -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
	config = function()
		local configs = require("nvim-treesitter.configs")

		configs.setup({
			ensure_installed = {"c", "lua", "vim", "nix", "nu"},
			sync_install = false,
			highlight = {enable = true },
			indent = {enable = true},
		})
	end,
}
