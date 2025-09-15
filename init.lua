-- ~/.config/nvim/init.lua
-- A beginner-friendly Neovim configuration using lazy.nvim package manager.

-- =============================================================================
-- 1. BOOTSTRAP LAZY.NVIM
-- =============================================================================
-- This section ensures that the lazy.nvim plugin manager is installed automatically
-- if it's not already present.

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- =============================================================================
-- 2. SET CORE NEOVIM OPTIONS
-- =============================================================================
-- These are basic settings for a better editing experience.

vim.opt.number = true         -- Show line numbers
vim.opt.relativenumber = true -- Show relative line numbers for easier jumping
vim.opt.mouse = 'a'           -- Enable mouse support in all modes
vim.opt.ignorecase = true     -- Ignore case when searching...
vim.opt.smartcase = true      -- ...unless the search term has uppercase letters
vim.opt.wrap = true          -- Do wrap long lines
vim.opt.termguicolors = true  -- Enable 24-bit RGB colors for themes

-- Tab and indentation settings
vim.opt.tabstop = 2           -- Number of spaces a <Tab> in the file counts for
vim.opt.softtabstop = 2       -- Number of spaces to insert for a <Tab>
vim.opt.shiftwidth = 2        -- Number of spaces to use for auto-indent
vim.opt.expandtab = true      -- Use spaces instead of tabs

-- =============================================================================
-- 3. DEFINE AND LOAD PLUGINS WITH LAZY.NVIM
-- =============================================================================
-- This is where we list all the plugins we want to use.
-- lazy.nvim will handle downloading, installing, and loading them.

require("lazy").setup({
  -- THEME
  -- This is our colorscheme. It should match the one you set in iTerm2.
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000, -- Make sure it loads first
    config = function()
      -- Configure Catppuccin
      require("catppuccin").setup({
        flavour = "macchiato", -- Or "latte", "frappe", "mocha"
        integrations = {
          -- Enable integrations with other plugins
          nvimtree = true,
          -- Add other integrations here if needed
        },
      })
      -- Load the colorscheme
      vim.cmd.colorscheme "catppuccin"
    end,
  },

  -- FILE EXPLORER
  -- A modern file explorer tree, replacing NERDTree.
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" }, -- Required for file icons
    config = function()
      require("nvim-tree").setup({
        -- Configuration options for nvim-tree
        view = {
          width = 30,
        },
        renderer = {
          group_empty = true,
          icons = {
            show = {
              file = true,
              folder = true,
              folder_arrow = true,
              git = true,
            },
          },
        },
      })
    end,
  },

  -- STATUS LINE
  -- A nice, configurable status line at the bottom of the editor.
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup({
        options = {
          theme = "catppuccin", -- Use the theme we installed
          -- You can customize sections here if you want
        },
      })
    end,
  },

})

-- =============================================================================
-- 4. DEFINE KEYMAPS
-- =============================================================================
-- These are custom keyboard shortcuts.

local map = vim.keymap.set

-- Set leader key to spacebar. The leader key is a prefix for custom shortcuts.
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- File Explorer Toggle
-- Press <leader>e (Space + e) to open or close the nvim-tree file explorer.
map("n", "<leader>e", ":NvimTreeToggle<CR>", { desc = "Toggle file explorer" })

-- Save file with <leader>s (Space + s)
map("n", "<leader>s", ":w<CR>", { desc = "Save file" })

-- Quit with <leader>q (Space + q)
map("n", "<leader>q", ":q<CR>", { desc = "Quit window" })
