-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

M.base46 = {
	theme = 'chadracula-evondev',
	theme_toggle = { 'chadracula-evondev', 'nord' },
	nvdash = {
		load_on_startup = true,
	},

	-- hl_override = {
	-- 	Comment = { italic = true },
	-- 	['@comment'] = { italic = true },
	-- },
}

return M
