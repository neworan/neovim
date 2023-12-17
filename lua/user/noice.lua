-- local status_ok, noice = pcall(require, "noice")
-- if not status_ok then
-- 	return
-- end

require("noice").setup({
	lsp = {
		-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
		override = {
			["vim.lsp.util.convert_input_to_markdown_lines"] = true,
			["vim.lsp.util.stylize_markdown"] = true,
			["cmp.entry.get_documentation"] = true,
		},
	},
	-- you can enable a preset for easier configuration
	-- presets = {
	-- 	bottom_search = false, -- use a classic bottom cmdline for search
	-- 	command_palette = false, -- position the cmdline and popupmenu together
	-- 	long_message_to_split = true, -- long messages will be sent to a split
	-- 	inc_rename = false, -- enables an input dialog for inc-rename.nvim
	-- 	lsp_doc_border = false, -- add a border to hover docs and signature help
	-- },
  -- views = {
  --   cmdline_output = {
  --     timeout = 200000,
  --   },
  -- },
  -- cmdline = {
    -- enabled = true,
    -- view = "cmdline",
    -- backend = "split",
  -- },
  cmdline_output = {
    view = "popup",
  }
	-- routes = {
	-- 	{
	-- 		filter = {
	-- 			event = "msg_show",
	-- 			any = {
	-- 				{ find = "%d+L, %d+B" },
	-- 				{ find = "; after #%d+" },
	-- 				{ find = "; before #%d+" },
	-- 			},
	-- 		},
	-- 		view = "mini",
	-- 	},
	-- },
	-- views = {
	-- 	cmdline_popup = {
	-- 		position = {
	-- 			row = 5,
	-- 			col = "50%",
	-- 		},
	-- 		size = {
	-- 			width = 60,
	-- 			height = "auto",
	-- 		},
	-- 	},
	-- 	popupmenu = {
	-- 		relative = "editor",
	-- 		position = {
	-- 			row = "65%",
	-- 			col = "50%",
	-- 		},
	-- 		size = {
	-- 			width = 60,
	-- 			height = 10,
	-- 		},
	-- 		border = {
	-- 			style = "rounded",
	-- 			padding = { 0, 1 },
	-- 		},
	-- 		win_options = {
	-- 			winhighlight = { Normal = "Normal", FloatBorder = "DiagnosticInfo" },
	-- 		},
	-- 	},
	-- },
	--   keys = {
	--       { "<S-Enter>", function() require("noice").redirect(vim.fn.getcmdline()) end, mode = "c", desc = "Redirect Cmdline" },
	--       { "<leader>ml", function() require("noice").cmd("last") end, desc = "Noice Last Message" },
	--       { "<leader>snh", function() require("noice").cmd("history") end, desc = "Noice History" },
	--       { "<leader>sna", function() require("noice").cmd("all") end, desc = "Noice All" },
	--       { "<leader>snd", function() require("noice").cmd("dismiss") end, desc = "Dismiss All" },
	--       { "<c-f>", function() if not require("noice.lsp").scroll(4) then return "<c-f>" end end, silent = true, expr = true, desc = "Scroll forward", mode = {"i", "n", "s"} },
	--       { "<c-b>", function() if not require("noice.lsp").scroll(-4) then return "<c-b>" end end, silent = true, expr = true, desc = "Scroll backward", mode = {"i", "n", "s"}},
	--     },
})
