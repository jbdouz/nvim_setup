local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")  

mason.setup()

mason_lspconfig.setup({
  ensure_installed = {
    "cssls",
    "cssmodules_ls",
    "unocss",
    "jsonls",
    "jdtls",
    "quick_lint_js",
    "tsserver",
    "vtsls",
    "ltex",
    "texlab",
    "lua_ls",
    "marksman",
    "prosemd_lsp",
    "remark_ls",
    "zk",
    "spectral",
    "jedi_language_server",
    "pyre",
    "pyright",
    "sourcery",
    "pylsp",
    "ruff_lsp",
    "r_language_server",
    "sqlls",
    "html",
  }
})
