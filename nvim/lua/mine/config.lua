vim.opt.termguicolors = true
vim.o.background = "dark"
vim.cmd [[ colorscheme gruvbox ]]

-- The following plugins need to have their setup() funcs explicitly called.
require("bufferline").setup()
require("gitsigns").setup()
require("nvim-treesitter.configs").setup({
    ensure_installed = "all",
    highlight = {
        enable = true,
    },
})
require("mason").setup()
require("mason-lspconfig").setup({ automatic_installation = true })

local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

-- Individual LSP servers.
require("lspconfig").intelephense.setup({ capabilities = capabilities })
require("lspconfig").eslint.setup({ capabilities = capabilities }) -- JavaScript & TypeScript.
require("lspconfig").tailwindcss.setup({ capabilities = capabilities })
require("null-ls").setup({
    sources = {
        require("null-ls").builtins.diagnostics.eslint_d.with({
            condition = function(utils)
                return utils.root_has_file({ '.eslintrc.js', '.eslintrc' })
            end,
        }),
        require("null-ls").builtins.diagnostics.trail_space.with({ disabled_filetypes = { 'NvimTree' } }),
        require("null-ls").builtins.formatting.eslint_d.with({
            condition = function(utils)
                return utils.root_has_file({ '.eslintrc.js', '.eslintrc.json', '.eslintrc' })
            end,
        }),
        require("null-ls").builtins.formatting.prettier.with({
            condition = function(utils)
                return utils.root_has_file({ '.prettierrc', '.prettierrc.json', '.prettierrc.yml', '.prettierrc.js', 'prettier.config.js' })
            end,
        }),
    },
})
require('mason-null-ls').setup({ automatic_installation = true })

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
vim.opt.spell = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.undofile = true
vim.opt.confirm = true

-- The gitsigns plugin adds info in the gutter, or first column. This flashes in
-- and out when you're working. This tells vim to render that left-hand gutter
-- column no matter what, which prevents that flashing.
vim.opt.signcolumn = "yes:1"

vim.opt.completeopt = "menuone,longest,preview"
