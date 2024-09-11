local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
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

-- require("lazy").setup({
--    "tanvirtin/monokai.nvim",       -- 主题插件
    -- LSP manager
-- 	"williamboman/mason.nvim",
--	"williamboman/mason-lspconfig.nvim",
--	"neovim/nvim-lspconfig",
    -- 文档树
-- })
require("lazy").setup({
    -- 主题插件
    "tanvirtin/monokai.nvim",
    -- LSP manager
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	"neovim/nvim-lspconfig",
    -- 文档树
    "nvim-tree/nvim-tree.lua",
    -- 状态栏
    "nvim-lualine/lualine.nvim",
    -- 自动补全引擎
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    -- 括号自动匹配
    "windwp/nvim-autopairs",
    -- 快速注释插件
    "numToStr/Comment.nvim",
})

-- 启动注释插件
