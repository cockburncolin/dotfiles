return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
		bigfile	= { enabled = true },
		dashboard = {
			enabled = true,
		},
		explorer = { enabled = true },
		indent = { enabled = true },
		layout = { enabled = true },
		notifier = { enabled = true },
		scope = { enabled = true },
		scroll = { enabled = true },
		statuscolumn = { enabled = true },
  },
}
