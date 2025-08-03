local lsp = require("lsp-zero")

lsp.preset("recommended")

lsp.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp.default_keymaps({buffer = bufnr})

  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', '<leader>oi', function()
    vim.lsp.buf.execute_command({
      command = "rust-analyzer.rewriteImports",
      arguments = { vim.api.nvim_buf_get_name(0) },
    })
  end, bufopts)
end)


local lspconfig = require("lspconfig")

lspconfig.lua_ls.setup{
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }
    }
}


require('mason').setup({})
require('mason-lspconfig').setup({
  -- Replace the language servers listed here 
  -- with the ones you want to install
  ensure_installed = {'rust_analyzer'},
  handlers = {
    lsp.default_setup,
  },
})

lsp.setup()
