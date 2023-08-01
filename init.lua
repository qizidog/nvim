-- # Method 1 - boot with LazyVim
-- In this way, smart-splits doesn't work as expect
-- default plugins of LazyVim has been disabled

--- [[
-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
-- ]]



-- # Method 2 - boot with original lazy.nvim
-- In this way, smart-splits works perfectly
-- Please uncomment method 2 below and comment Method 1 for test.

--[[
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

plugins = {
	{
		"mrjones2014/smart-splits.nvim",
		opts = {
			at_edge = 'wrap',
		},
		config = function(_, opts)
			-- change focus window
			vim.keymap.set("n", "<C-h>", require("smart-splits").move_cursor_left, { desc = "Move to left window" })
			vim.keymap.set("n", "<C-j>", require("smart-splits").move_cursor_down, { desc = "Move to down window" })
			vim.keymap.set("n", "<C-k>", require("smart-splits").move_cursor_up, { desc = "Move to up window" })
			vim.keymap.set("n", "<C-l>", require("smart-splits").move_cursor_right, { desc = "Move to right window" })

			-- resize window
			vim.keymap.set("n", "<C-Left>", require("smart-splits").resize_left, { desc = "smart resize left" })
			vim.keymap.set("n", "<C-Down>", require("smart-splits").resize_down, { desc = "smart resize down" })
			vim.keymap.set("n", "<C-Up>", require("smart-splits").resize_up, { desc = "smart resize up" })
			vim.keymap.set("n", "<C-Right>", require("smart-splits").resize_right, { desc = "smart resize right" })
			require("smart-splits").setup(opts)
		end,
	}
}

require("lazy").setup(plugins, opts)
--]]


