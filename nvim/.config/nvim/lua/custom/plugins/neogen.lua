return {
	{
		"danymat/neogen",
		config = function()
			require("neogen").setup({})
		end,
		lazy = true,
		cmd = "Neogen",
		-- Uncomment next line if you want to follow only stable versions
		-- version = "*"
	},
}
