local opts = { noremap = true, silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap('', '<Space>', '<Nop>', opts)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Window navigation
keymap('n', '<leader>h', '<C-w>h', opts)
keymap('n', '<leader>j', '<C-w>j', opts)
keymap('n', '<leader>k', '<C-w>k', opts)
keymap('n', '<leader>l', '<C-w>l', opts)

-- Navigate buffers
keymap('n', '<S-l>', ':bnext<CR>', opts)
keymap('n', '<S-h>', ':bprevious<CR>', opts)

-- Save
keymap('n', '<leader>w', ':w<CR>', opts)

-- Quit
keymap('n', '<leader>q', ':q<CR>', opts)

-- Telescope
keymap('n', '<C-p>', ':Telescope find_files<CR>', opts)
keymap('n', '<leader><leader>', ':Telescope buffers<CR>', opts)
keymap('n', '<c-_>', ':telescope current_buffer_fuzzy_find<CR>', opts)
keymap('n', '<leader>g', ':Telescope live_grep<CR>', opts)

-- nvim-tree
keymap('n', '<leader>f', ':NvimTreeToggle<CR>', opts)

-- Remove highlight
keymap('n', '<leader>n', ':noh<CR>', opts)

-- Format
keymap('n', '<leader>s', ':Format<CR>', opts)
