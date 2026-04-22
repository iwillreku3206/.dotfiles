local model = "gemma4:31b"

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
								options = {
									default = {
										temperature = 0.2,
										top_p = 0.5,
										top_k = 64,
									},
								},
							},
						})
					end,
				},
			},
		},
		lazy = false,
	},
	{
		"milanglacier/minuet-ai.nvim",
		config = function()
			require("minuet").setup({
				request_timeout = 300,
				virtualtext = {
					auto_trigger_ft = { "lua", "python", "javascript", "typescript", "go", "rust" },
					keymap = {
						-- accept whole completion
						accept = "<M-l>",
						-- accept one line
						accept_line = "<A-L>",
						-- accept n lines (prompts for number)
						-- e.g. "A-z 2 CR" will accept 2 lines
						accept_n_lines = "<A-z>",
						-- Cycle to prev completion item, or manually invoke completion
						prev = "<A-[>",
						-- Cycle to next completion item, or manually invoke completion
						next = "<A-]>",
						dismiss = "<A-e>",
					},
				},
				provider = "openai_fim_compatible",
				n_completions = 1, -- recommend for local model for resource saving
				-- I recommend beginning with a small context window size and incrementally
				-- expanding it, depending on your local computing power. A context window
				-- of 512, serves as an good starting point to estimate your computing
				-- power. Once you have a reliable estimate of your local computing power,
				-- you should adjust the context window to a larger value.
				context_window = 1024,
				provider_options = {
					openai_fim_compatible = {
						api_key = function()
							return "dummy_key"
						end,
						name = "Ollama",
						end_point = "http://gpu-vm.home.rinaldolee.com:11434/v1/completions",
						model = "qwen2.5-coder-minicontext:3b", -- custom model capped at 1024 tokens
						optional = {
							max_tokens = 56,
							top_p = 0.9,
						},
					},
				},
			})
		end,
		dependencies = { "nvim-lua/plenary.nvim" },
	},
}
