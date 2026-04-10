local model = "gemma4:26b"

return {
	{
		"olimorris/codecompanion.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
		opts = {
			interactions = {
				chat = {
					adapter = "ollama",
					model = model,
					opts = {
						completion_provider = "blink",
					},
					tools = {
						["run_command"] = {
							opts = {
								require_approval_before = true,
							},
						},
						opts = {
							auto_submit_errors = true, -- Send any errors to the LLM automatically?
							auto_submit_success = true, -- Send any successful output to the LLM automatically?
						},
					},
				},
				inline = {
					adapter = "ollama",
					model = model,
				},
			},
			adapters = {
				http = {
					ollama = function()
						return require("codecompanion.adapters").extend("ollama", {
							env = {
								url = "http://gpu-vm.home.rinaldolee.com:11434", -- safe to publish, this is on my personal intranet
							},
							headers = {
								["Content-Type"] = "application/json",
							},
							parameters = {
								sync = true,
							},
							schema = {
								model = {
									default = model,
								},
								keep_alive = {
									default = "15m",
								},
							},
						})
					end,
				},
			},
		},
		lazy = false,
	},
}
