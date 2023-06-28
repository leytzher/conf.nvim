-- place this in one of your configuration file(s)
local hop = require('hop')
vim.api.nvim_set_keymap("n","s",":HopAnywhere<CR>", {silent=true})
vim.api.nvim_set_keymap("n","S",":HopWord<CR>", {silent=true})
