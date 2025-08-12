-- Quickly clear search highlighting.
vim.keymap.set("n", "<leader>k", ":nohlsearch<CR>")

-- Telescope triggers.
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>f", builtin.find_files, {})
vim.keymap.set("n", "<leader>g", builtin.live_grep, {})
vim.keymap.set("n", "<leader>b", builtin.buffers, {})
-- vim.keymap.set("n", "<leader>h", builtin.help_tags, {})
vim.keymap.set("n", "<leader>s", builtin.lsp_document_symbols, {})

-- Tree triggers.
vim.keymap.set("n", "<leader>e", ":NvimTreeFindFileToggle<CR>")

-- LSP-related keybinds.
vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
vim.keymap.set("n", "gi", ":Telescope lsp_implementations<CR>")
vim.keymap.set("n", "gr", ":Telescope lsp_references<CR>")
vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>")
vim.keymap.set("n", "<leader>d", "<cmd>lua vim.diagnostic.open_float()<CR>")
vim.api.nvim_create_user_command('Format', function() vim.lsp.buf.format({ timeout_ms = 5000 }) end, {})
vim.keymap.set("n", "<leader>l", ":Format<CR>") -- leader + l for lint
