-- local model = "Qwen3.6-35B-A3B-UD-Q4_K_M"
local model = "Qwen3.6-27B-Q3_K_S-MTP"
-- local model = "Qwen3-Coder-30B-A3B-Instruct-Q3_K_S"

return {
	{
		"olimorris/codecompanion.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
		opts = {
			rules = {
				default = {
					description = "Collection of common files for all projects",
					files = {
						".clinerules",
						".cursorrules",
						".goosehints",
						".rules",
						".windsurfrules",
						".github/copilot-instructions.md",
						"AGENT.md",
						"AGENTS.md",
						{ path = "CLAUDE.md", parser = "claude" },
						{ path = "CLAUDE.local.md", parser = "claude" },
						{ path = "~/.claude/CLAUDE.md", parser = "claude" },
					},
					is_preset = true,
				},
				opts = {
					chat = {
						autoload = "default", -- The rule groups to load
						enabled = true,
					},
				},
			},
			interactions = {
				chat = {
					adapter = "llama.cpp",
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
					adapter = "llama.cpp",
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
										temperature = 1.0,
										top_p = 0.95,
										top_k = 20,
									},
								},
							},
						})
					end,
					["llama.cpp"] = function()
						return require("codecompanion.adapters").extend("openai_compatible", {
							env = {
								url = "http://gpu-vm.home.rinaldolee.com:5678",
								api_key = "TERM", -- Set LLAMA_API_KEY in your environment
								chat_url = "/v1/chat/completions",
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
										temperature = 1.0,
										top_p = 0.95,
										top_k = 20,
									},
								},
							},
							handlers = {
								form_messages = function(self, messages)
									local system_content = {}
									local other_messages = {}
									-- 1. Separate system messages from everything else
									for _, msg in ipairs(messages) do
										if msg.role == "system" then
											table.insert(system_content, msg.content)
										else
											table.insert(other_messages, msg)
										end
									end
									local final_messages = {}
									-- 2. If there are system messages, merge them into ONE message at the top
									if #system_content > 0 then
										table.insert(final_messages, {
											role = "system",
											content = table.concat(system_content, "\n\n"),
										})
									end
									-- 3. Append all the user/assistant messages
									for _, msg in ipairs(other_messages) do
										table.insert(final_messages, msg)
									end
									-- 4. Pass the cleaned messages to the standard OpenAI handler
									local openai = require("codecompanion.adapters.http.openai")
									return openai.handlers.form_messages(self, final_messages)
								end,
								parse_message_meta = function(self, data)
									local extra = data.extra
									if extra and extra.reasoning_content then
										data.output.reasoning = { content = extra.reasoning_content }
										if data.output.content == "" then
											data.output.content = nil
										end
									end
									return data
								end,
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
