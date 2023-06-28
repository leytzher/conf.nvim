require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = { "lua_ls", "tsserver", "tailwindcss","jedi_language_server", "svelte" }
})

local on_attach = function(_, bufnr)
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, {}) --<leader> rn to rename buffer
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {}) 

  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})  --gd to go to definition
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {})  --gd to go to implementation
  vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, {}) -- gr to open telescope 
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})  
end



require("lspconfig").lua_ls.setup {
  on_attach = on_attach}
require("lspconfig").tsserver.setup {
  on_attach = on_attach}
require("lspconfig").jedi_language_server.setup {
  on_attach = on_attach}
require("lspconfig").tailwindcss.setup {
  on_attach = on_attach}
require("lspconfig").svelte.setup {
  on_attach = on_attach}

