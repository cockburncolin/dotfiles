return {
	"nvim-orgmode/orgmode",
	event = "VeryLazy",
	ft = {"org"},
	config = function()
		require("orgmode").setup({
			org_agenda_files = "~/org/**/*",
			org_default_nodes_file = "~/org/refile.org",
      org_startup_folded = "inherit",
      org_todo_keyword_faces = {
        TODO = ":foreground green :weight bold"
      },
		})
	end,
}
