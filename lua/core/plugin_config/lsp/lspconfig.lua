-- references: https://github.com/williamboman/mason-lspconfig.nvim/blob/main/doc/server-mapping.md

local lspconfig = require('lspconfig')
local cmp_nvim_lsp = require('cmp_nvim_lsp')
local typescript = require('typescript')

local keymap = vim.keymap

-- enable keybinds for available lsp server
local on_attach = function(client, bufnr)
    -- keybind options
  local opts = { noremap = true, silent = true, buffer = bufnr }

  -- set keybinds
  keymap.set("n", "gf", "<cmd>Lspsaga lsp_finder<CR>", opts) -- show definition, references
  keymap.set("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts) -- got to declaration
  keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>", opts) -- see definition and make edits in window
  keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts) -- go to implementation
  keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts) -- see available code actions
  keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts) -- smart rename
  keymap.set("n", "<leader>D", "<cmd>Lspsaga show_line_diagnostics<CR>", opts) -- show  diagnostics for line
  keymap.set("n", "<leader>d", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts) -- show diagnostics for cursor
  keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts) -- jump to previous diagnostic in buffer
  keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts) -- jump to next diagnostic in buffer
  keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts) -- show documentation for what is under cursor
  keymap.set("n", "<leader>o", "<cmd>LSoutlineToggle<CR>", opts) -- see outline on right hand side

  -- typescript specific keymaps (e.g. rename file and update imports)
  if client.name == "tsserver" then
    keymap.set("n", "<leader>rf", ":TypescriptRenameFile<CR>") -- rename file and update imports
    keymap.set("n", "<leader>oi", ":TypescriptOrganizeImports<CR>") -- organize imports (not in youtube nvim video)
    keymap.set("n", "<leader>ru", ":TypescriptRemoveUnused<CR>") -- remove unused variables (not in youtube nvim video)
  end
end

-- used to enable autocompletion (assign to every lsp server config)
local capabilities = cmp_nvim_lsp.default_capabilities()

-- Change the Diagnostic symbols in the sign column (gutter)
-- (not in youtube nvim video)
local signs = { Error = " ", Warn = " ", Hint = "ﴞ ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

-- frontend
--- configure html server
lspconfig["html"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
})
--- CSS
lspconfig["cssls"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
})
lspconfig["cssmodules_ls"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
})
--- javascript
---- quick_lint_js finds bugs in javascript
lspconfig["quick_lint_js"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

--- configure typescript server with plugin
typescript.setup({
  server = {
    capabilities = capabilities,
    on_attach = on_attach,
  },
})

-- python
lspconfig["pyright"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

lspconfig["sourcery"].setup {
  init_options = {
    --- The Sourcery token for authenticating the user.
    --- This is retrieved from the Sourcery website and must be
    --- provided by each user. The extension must provide a
    --- configuration option for the user to provide this value.
    token = "user_5PpYj8LopCUNr4wtWHVg_Wto8OEC_RTTVRGyMNvfiqAP7zmaSaTsHqHvcn0",

    --- The extension's name and version as defined by the extension.
    extension_version = 'vim.lsp',

    --- The editor's name and version as defined by the editor.
    editor_version = 'vim',
  },
}

-- Java
lspconfig["jdtls"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
})
lspconfig["java_language_server"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

-- latex
lspconfig["ltex"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
})
--- texlab: A completion engine built from scratch for (La)TeX.
lspconfig["texlab"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

-- markdown
lspconfig["marksman"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

-- R
lspconfig["r_language_server"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

-- SQL
lspconfig["sqlls"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

-- Shell scripting
--- configure lua server (with special settings)
lspconfig["lua_ls"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
  settings = { -- custom settings for lua
    Lua = {
      -- make the language server recognize "vim" global
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        -- make language server aware of runtime files
        library = {
          [vim.fn.expand("$VIMRUNTIME/lua")] = true,
          [vim.fn.stdpath("config") .. "/lua"] = true,
        },
      },
    },
  },
})

--- bash language server
lspconfig["bashls"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

