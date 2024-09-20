-- 创建一个自动命令组
vim.api.nvim_create_augroup('IMSelect', { clear = true })

-- 在进入插入模式时执行 :!im-select 2052
vim.api.nvim_create_autocmd('InsertEnter', {
    group = 'IMSelect',
    callback = function()
        vim.fn.system('im-select.exe 2052')
    end
})

-- 在离开插入模式（进入正常模式）时执行 :!im-select 1033
vim.api.nvim_create_autocmd('InsertLeave', {
    group = 'IMSelect',
    callback = function()
        vim.fn.system('im-select.exe 1033')
    end
})

