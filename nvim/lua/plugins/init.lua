return {
  { "ellisonleao/gruvbox.nvim", priority = 1000, config = true },
  "tpope/vim-commentary",
  "tpope/vim-surround",
  "tpope/vim-sleuth",
  "tpope/vim-repeat",
  "tpope/vim-unimpaired",
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = true,
    -- use opts = {} for passing setup options
    -- testing is equivalent to setup({}) function
  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-live-grep-args.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
    },
    opts = {
      defaults = {
        file_ignore_patterns = { ".git/" },
      },
      pickers = {
        find_files = {
          hidden = true,
        },
      },
    },
  },
  {
    "kyazdani42/nvim-tree.lua",
    opts = {
      git = {
        ignore = false,
      },
      renderer = {
        group_empty = true,
        icons = {
          show = {
            folder_arrow = false,
          },
        },
      },
    },
  },
  { "akinsho/bufferline.nvim", version = "*" },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    dependencies = "JoosepAlviste/nvim-ts-context-commentstring",
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "jose-elias-alvarez/null-ls.nvim",
      "jayp0521/mason-null-ls.nvim",
    },
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lsp-signature-help",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
    },
    config = function()
      local cmp = require('cmp')
      local luasnip = require('luasnip')

      require('luasnip/loaders/from_snipmate').lazy_load()

      local has_words_before = function()
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
      end

      cmp.setup({
        preselect = false,
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        view = {
          entries = { name = 'custom', selection_order = 'near_cursor' },
        },
        window = {
          completion = {
            col_offset = -2 -- align the abbr and word on cursor (due to fields order below)
          }
        },
        formatting = {
          fields = { "kind", "abbr", "menu" },
        },
        mapping = {
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            elseif has_words_before() then
              cmp.complete()
            else
              fallback()
            end
          end, { "i", "s" }),
          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),
          ['<CR>'] = cmp.mapping.confirm({ select = false }),
        },
        sources = {
          { name = 'nvim_lsp' },
          { name = 'nvim_lsp_signature_help' },
          { name = 'luasnip' },
          { name = 'buffer' },
          { name = 'path' },
        },
        experimental = {
          ghost_text = true,
        },
      })
    end,
  },
}
