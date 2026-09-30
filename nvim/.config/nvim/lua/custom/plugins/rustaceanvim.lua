vim.g.rustaceanvim = {
	server = {
		settings = {
			["rust-analyzer"] = {
				cargo = {
					target = "x86_64-unknown-linux-gnu",
				},
			},
		},
	},
}

return {
	{
		"mrcjkb/rustaceanvim",
		version = "^7", -- Recommended
		ft = { "rust" },
		lazy = true,
	},
}
