return {
	"nvim-orgmode/orgmode",
	event = "VeryLazy",
	ft = {"org"},
	config = function()
		require("orgmode").setup({
			org_agenda_files = "~/org/**/*",
			org_default_nodes_file = "~/org/refile.org",
		})
	end,
}
