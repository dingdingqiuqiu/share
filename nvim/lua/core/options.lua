-- 局部变量
local opt = vim.opt

-- 光标距离窗口一定距离时，开始滚动屏幕内容
vim.o.scrolloff = 10

-- 行号
opt.relativenumber = true
opt.number = true

-- 缩进
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true

-- 自动换行
-- markdown便于显示
vim.api.nvim_create_autocmd("FileType", {
    pattern = "markdown",
    callback = function()
        vim.opt_local.wrap = true
    end,
})
-- 常用语言防止包裹
vim.api.nvim_create_autocmd("FileType", {
    pattern = {"python", "c", "cpp", "java"},
    callback = function()
        vim.opt_local.wrap = false
    end,
})

-- 光标行
opt.cursorline = true

-- 启用鼠标
opt.mouse:append("a")

-- 系统剪贴板
opt.clipboard:append("unnamedplus")

-- 默认新窗口右和下
opt.splitright = true
opt.splitbelow = true

-- 搜索
opt.ignorecase = true
opt.smartcase = true

-- 外观
opt.termguicolors = true
opt.signcolumn = "yes"
vim.cmd[[colorscheme tokyonight-moon]]
