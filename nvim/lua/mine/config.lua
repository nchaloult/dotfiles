vim.opt.termguicolors = true
vim.o.background = "dark"
vim.cmd [[ colorscheme gruvbox ]]

-- The following plugins need to have their setup() funcs explicitly called.
require("bufferline").setup()
require("nvim-treesitter.configs").setup({
    ensure_installed = "all",
    highlight = {
        enable = true,
    },
})
require("mason").setup()
require("mason-lspconfig").setup({ automatic_installation = true })

local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Individual LSP servers.
vim.lsp.config.intelephense = {
  filetypes = { 'php' },
  capabilities = capabilities,
}
vim.lsp.config.eslint = {
  filetypes = { 'javascript', 'javascriptreact', 'javascript.jsx', 'typescript', 'typescriptreact', 'typescript.tsx', 'astro' },
  capabilities = capabilities,
}
vim.lsp.config.tailwindcss = { capabilities = capabilities } -- TODO: Might need to explicitly specify filetypes.

vim.opt.colorcolumn = "72,80,88"
vim.opt.linebreak = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.ruler = true
vim.opt.scrolloff = 2
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.title = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.undofile = true
vim.opt.confirm = true

vim.opt.completeopt = "menuone,longest,preview"

-- Enable spell checking only for markdown files.
vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    vim.opt_local.spell = true
  end,
})
