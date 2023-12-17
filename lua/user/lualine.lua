local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
	return
end

-- local hide_in_width = function()
-- 	return vim.fn.winwidth(0) > 80
-- end

-- local diagnostics = {
-- 	"diagnostics",
-- 	sources = { "nvim_diagnostic" },
-- 	sections = { "error", "warn" },
-- 	symbols = { error = " ", warn = " " },
-- 	colored = false,
-- 	update_in_insert = false,
-- 	always_visible = true,
-- }

-- local diff = {
-- 	"diff",
-- 	colored = false,
-- 	symbols = { added = " ", modified = " ", removed = " " }, -- changes diff symbols
--   cond = hide_in_width
-- }

-- local mode = {
-- 	"mode",
-- 	fmt = function(str)
-- 		return "-- " .. str .. " --"
-- 	end,
-- }

-- local filetype = {
-- 	"filetype",
-- 	icons_enabled = false,
-- 	icon = nil,
-- }

-- local branch = {
-- 	"branch",
-- 	icons_enabled = true,
-- 	icon = "",
-- }

-- local location = {
-- 	"location",
-- 	padding = 0,
-- }

-- cool function for progress
-- local progress = function()
-- 	local current_line = vim.fn.line(".")
-- 	local total_lines = vim.fn.line("$")
-- 	local chars = { "__", "▁▁", "▂▂", "▃▃", "▄▄", "▅▅", "▆▆", "▇▇", "██" }
-- 	local line_ratio = current_line / total_lines
-- 	local index = math.ceil(line_ratio * #chars)
-- 	return chars[index]
-- end

-- local spaces = function()
-- 	return "spaces: " .. vim.api.nvim_buf_get_option(0, "shiftwidth")
-- end

local icons = require("lazyvim.config").icons

lualine.setup({
	options = {
		theme = "auto",
		globalstatus = true,
		disabled_filetypes = { statusline = { "dashboard", "alpha", "starter" } },
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "branch" },
		lualine_c = {
			require("lazyvim.util").lualine.root_dir(),
			{
				"diagnostics",
				symbols = {
					error = icons.diagnostics.Error,
					warn = icons.diagnostics.Warn,
					info = icons.diagnostics.Info,
					hint = icons.diagnostics.Hint,
				},
			},
			{
				"filetype",
				icon_only = true,
				separator = "",
				padding = { left = 1, right = 0 },
			},
			{ require("lazyvim.util").lualine.pretty_path() },
		},
		lualine_x = {
      -- stylua: ignore
      {
        function() return require("noice").api.status.command.get() end,
        cond = function() return package.loaded["noice"] and require("noice").api.status.command.has() end,
        color = require("lazyvim.util").ui.fg("Statement"),
      },
			-- -- stylua: ignore
      -- {
      --   require("noice").api.statusline.mode.get,
      --   cond = require("noice").api.statusline.mode.has,
      --   color = { fg = "#ff9e64" },
      -- },
			{
				function()
					return require("noice").api.status.mode.get()
				end,
				cond = function()
					return package.loaded["noice"] and require("noice").api.status.mode.has()
				end,
				color = require("lazyvim.util").ui.fg("Constant"),
			},
			-- -- stylua: ignore
			{
				function()
					return "  " .. require("dap").status()
				end,
				cond = function()
					return package.loaded["dap"] and require("dap").status() ~= ""
				end,
				color = require("lazyvim.util").ui.fg("Debug"),
			},
			{
				require("lazy.status").updates,
				cond = require("lazy.status").has_updates,
				color = require("lazyvim.util").ui.fg("Special"),
			},
			{
				"diff",
				symbols = {
					added = icons.git.added,
					modified = icons.git.modified,
					removed = icons.git.removed,
				},
				source = function()
					local gitsigns = vim.b.gitsigns_status_dict
					if gitsigns then
						return {
							added = gitsigns.added,
							modified = gitsigns.changed,
							removed = gitsigns.removed,
						}
					end
				end,
			},
		},
		lualine_y = {
			{ "progress", separator = " ", padding = { left = 1, right = 0 } },
			{ "location", padding = { left = 0, right = 1 } },
		},
		lualine_z = {
			function()
				return " " .. os.date("%R")
			end,
		},
	},
	extensions = { "neo-tree", "lazy" },
})
