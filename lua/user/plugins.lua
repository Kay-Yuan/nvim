local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    'git',
    'clone',
    '--depth',
    '1',
    'https://github.com/wbthomason/packer.nvim',
    install_path,
  }
  print 'Installing packer close and reopen Neovim...'
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, 'packer')
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require('packer.util').float { border = 'rounded' }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)
  -- My plugins here
  use { 'wbthomason/packer.nvim', commit = 'c576ab3f1488ee86d60fd340d01ade08dcabd256' } -- Have packer manage itself

  -- Color Scheme
  use { 'morhetz/gruvbox', commit = 'bf2885a95efdad7bd5e4794dd0213917770d79b7' }
  use { 'Mofiqul/dracula.nvim', commit = 'a219971291c56bcca3827cb7bd40aaaef23feeca' }

  -- Status line
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    commit = '7db1db3cd97079cf9c0089bc04afe71e90256a23',
  }

  -- File search
  use { 'nvim-lua/popup.nvim', commit = 'b7404d35d5d3548a82149238289fa71f7f6de4ac' }
  use { 'nvim-lua/plenary.nvim', commit = '14dfb4071022b22e08384ee125a5607464b6d397' }

  use {
    'nvim-telescope/telescope.nvim',
    requires = { { 'nvim-lua/plenary.nvim' } },
    commit = 'a36a813d5d031e6f5d52b74986915e68130febd9',
  }

  use { 'windwp/nvim-autopairs', commit = '6617498bea01c9c628406d7e23030da57f2f8718' }
  use { 'karb94/neoscroll.nvim', commit = '07242b9c29eed0367cb305d41851b2e04de9052e' }
  -- icon
  use { 'ryanoasis/vim-devicons', commit = 'a2258658661e42dd4cdba4958805dbad1fe29ef4' }
  use { 'kyazdani42/nvim-web-devicons', commit = '4415d1aaa56f73b9c05795af84d625c610b05d3b' }

  -- cmp plugins
  use { 'hrsh7th/nvim-cmp', commit = '71d7f46b930bf08e982925c77bd9b0a9808c1162' } -- The completion plugin
  use { 'hrsh7th/cmp-buffer', commit = 'd66c4c2d376e5be99db68d2362cd94d250987525' } -- buffer completions
  use { 'hrsh7th/cmp-path', commit = '466b6b8270f7ba89abd59f402c73f63c7331ff6e' } -- path completions
  use { 'hrsh7th/cmp-cmdline', commit = 'f4beb74e8e036f9532bedbcac0b93c7a55a0f8b0' } -- cmdline completions
  use { 'saadparwaiz1/cmp_luasnip', commit = 'd6f837f4e8fe48eeae288e638691b91b97d1737f' } -- snippet completions
  use { 'hrsh7th/cmp-nvim-lsp', commit = 'ebdfc204afb87f15ce3d3d3f5df0b8181443b5ba' }

  -- snippets
  use { 'L3MON4D3/LuaSnip', commit = '0d33649415c069af7486b36709bcbebc47fc4f71' } --snippet engine
  use { 'rafamadriz/friendly-snippets', commit = 'ad07b2844021b20797adda5b483265802559a693' } -- a bunch of snippets to use

  -- LSP
  use { 'neovim/nvim-lspconfig', commit = '710deb04d9f8b73517e1d995a57a1505cbbaac51' } -- enable LSP
  use { 'williamboman/nvim-lsp-installer', commit = 'dc783087bef65cc7c2943d8641ff1b6dfff6e5a9' } -- simple to use language server installer
  use { 'jose-elias-alvarez/null-ls.nvim', commit = '041601cb03daa8982c5af6edc6641f4b97e9d6b5' } -- for formatters and linters

  -- Treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    commit = 'fd92e70c69330dd8f2f6753d3d987c34e7dacd24',
  }

  -- nvim-tree
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icon
    },
    commit = 'ec3f10e2116f344d9cc5c9980bddf7819f27d8ae',
  }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require('packer').sync()
  end
end)
