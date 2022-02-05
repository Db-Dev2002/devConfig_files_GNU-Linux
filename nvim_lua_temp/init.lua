-- use space as the leader key
vim.g.mapleader = ' '

-- packer path
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'

-- Install packer
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
end

vim.cmd [[
  augroup Packer
    autocmd!
    autocmd BufWritePost init.lua PackerCompile
  augroup end
]]

local use = require('packer').use
require('packer').startup(function()
  -- Package manager
  use 'wbthomason/packer.nvim'

  ------ Utils
  -- Git integration
  use 'tpope/vim-fugitive'
  -- Git integration :help compl-omni
  use 'tpope/vim-rhubarb'
  -- Make comments easier
  use 'numToStr/Comment.nvim'
  -- Relative lines on current buf(normal mode) only
  use 'jeffkreeftmeijer/vim-numbertoggle'
  -- Automatic tags management
  use 'ludovicchabant/vim-gutentags'
  -- EasyMotion provides a much simpler way to use some motions in vim
  use 'easymotion/vim-easymotion'

  use{ "nvim-lua/popup.nvim" }
  use{ "nvim-lua/plenary.nvim" }

  ------ Telescope
  use "nvim-telescope/telescope.nvim"
  use {
	"nvim-telescope/telescope-fzf-native.nvim", 
	run = "make" 
  }
  use "nvim-telescope/telescope-rs.nvim"
  use "nvim-telescope/telescope-fzf-writer.nvim"
  use "nvim-telescope/telescope-github.nvim"
  use "nvim-telescope/telescope-symbols.nvim"
  use "nvim-telescope/telescope-hop.nvim"
  use "nvim-telescope/telescope-file-browser.nvim"
  use "nvim-telescope/telescope-ui-select.nvim"
  use "nvim-telescope/telescope-smart-history.nvim"

  ------ UI settings
  -- select files, grep results, open buffers...
  use {'nvim-telescope/telescope.nvim', requires = {'nvim-lua/plenary.nvim'} }
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  -- Colorshemes
  use 'mjlbach/onedark.nvim'
  -- use 'navarasu/onedark.nvim'
  use 'EdenEast/nightfox.nvim'
  -- Status line
  use 'nvim-lualine/lualine.nvim'
  -- Add indentation guides even on blank lines
  use 'lukas-reineke/indent-blankline.nvim'
  -- Add git related info in the signs columns and popups
  use {
	'lewis6991/gitsigns.nvim', 
	requires = {'nvim-lua/plenary.nvim'} 
  }
  -- Highlight, edit, and navigate code using a fast incremental parsing library
  use 'nvim-treesitter/nvim-treesitter'
  -- Additional textobjects for treesitter
  use 'nvim-treesitter/nvim-treesitter-textobjects'
  -- color codes highlighter
  use "norcalli/nvim-colorizer.lua"
  -- ansi escape codes(colors) ft
  use {
    "norcalli/nvim-terminal.lua",
    config = function()
      require("terminal").setup()
    end,
  }
  -- Make comments appear IN YO FACE
  use {
    "tjdevries/vim-inyoface",
    config = function()
      vim.api.nvim_set_keymap("n", "<leader>cc", "<Plug>(InYoFace_Toggle)", {})
    end,
  }

  ------ LSP settings 
  -- Collection of configurations for built-in LSP client
  use 'neovim/nvim-lspconfig'
  -- Autocomplete plugins
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-nvim-lua'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'saadparwaiz1/cmp_luasnip'
  -- Snippets plugin
  use 'L3MON4D3/LuaSnip'
end) 

--Set highlight on search
vim.o.hlsearch = false
--Make line numbers default
vim.wo.number = true
--Enable mouse mode
vim.o.mouse = 'a'
--Set colorscheme
vim.o.termguicolors = true

-- require('onedark').load()

--local nightfox = require('nightfox')

-- This function set the configuration of nightfox. If a value is not passed in the setup function
-- it will be taken from the default configuration above
-- nightfox.setup({
--  styles = {
--    comments = "italic", -- change style of comments to be italic
--    keywords = "bold", -- change style of keywords to be bold
--     functions = "italic,bold" -- styles can be a comma separated list
--   },
--   inverse = {
--     match_paren = true, -- inverse the highlighting of match_parens
--   },
--   colors = {
--     -- red = "#FF000", -- Override the red color for MAX POWER
--     bg = "#282c34",
--     -- bg_alt = "#000000",
--   },
--   hlgroups = {
--     -- TSPunctDelimiter = { fg = "${red}" }, -- Override a highlight group with the color red
--     -- LspCodeLens = { bg = "#000000", style = "italic" },
--   }
-- })
-- print(vim.inspect(require('nightfox.colors').init()))
-- Load the configuration set above and apply the colorscheme
-- nightfox.load()

--require('telescope').setup({
--  defaults = {
--    layout_config = { ivy },
--    -- other defaults configuration here
--  },
--  -- other configuration values here
--  extensions = {
--    fzf = {
--      fuzzy = true,                    -- false will only do exact matching
--      override_generic_sorter = true,  -- override the generic sorter
--      override_file_sorter = true,     -- override the file sorter
--      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
--    }                                  -- the default case_mode is "smart_case"
--  }
--})

require('telescope').setup({
    defaults = { 
        file_ignore_patterns = {"node_modules", "/dist"},
        layout_strategy = 'flex'
    },
    extensions = {
        frecency = {
            show_scores = false,
            show_unindexed = true,
            ignore_patterns = {"*.git/*", "*/tmp/*", "*/node_modules/*"},
        }
    }
})

-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
-- require('telescope').load_extension('fzf')

vim.cmd [[colorscheme onedark]]