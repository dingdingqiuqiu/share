local builtin = require('telescope.builtin')

-- 进入telescope页面会是插入模式，回到正常模式就可以用j和k来移动了

vim.keymap.set('n', '<leader>ff', builtin.find_files, {}) -- 当前文件夹文件
vim.keymap.set('n', '<leader>fo', builtin.oldfiles, {})   -- 最近文件
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})  -- 当前文件夹所有文件内容
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})    -- 打开的缓冲区
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})  -- 帮助文档

