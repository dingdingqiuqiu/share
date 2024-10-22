vim.g.mapleader = " "

local keymap = vim.keymap

---------- 复制模式 ---------- ---
-- 后面发现格式混乱问题只会发生在插入模式非paste模式下，正常模式下使用p命令用寄存器复制就没这个问题，只需要定义下删除全部\r的快捷键即可。因为win下换行是\n\r,lin下是\n,所以有这个问题
-- 定义 p 命令，同时删除结尾的 \r 符号
-- 实际上wsl中ssh到的服务器直接鼠标右键即可，tmux中直接C-S-v,而wsl中的neovim仍需要使用改良过的p命令
vim.api.nvim_set_keymap('n', 'p', 'p:%s/\\r$//g<CR>', { noremap = true, silent = true })

-- ---------- 插入模式 ---------- ---
keymap.set("i", "jk", "<ESC>")

-- ---------- 视觉模式 ---------- ---
-- 单行或多行移动
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- ---------- 正常模式 ---------- ---
-- 简化
-- <leader>c删除当前缓冲区
vim.keymap.set("n", "<leader>c", function()
      local current_win = vim.api.nvim_get_current_win()  -- 获取当前窗口编号
      local wins = vim.api.nvim_list_wins()  -- 获取所有窗口编号列表
      -- 检查是否存在NvimTree窗口
      local nvimtree_exists = false
        for _, win in ipairs(wins) do
            local buf = vim.api.nvim_win_get_buf(win)
                if vim.api.nvim_buf_get_name(buf):match("NvimTree_") then
                      nvimtree_exists = true
                      break
        end
      end
      if #wins > 2 or (#wins == 2 and not nvimtree_exists)then
        vim.cmd('wincmd p')  -- 跳转到上一个窗口
        vim.api.nvim_win_close(current_win, false)  -- 关闭当前窗口
      else
        local bufnr = vim.fn.bufnr('%')  -- 获取当前缓冲区编号
        local buffers = vim.api.nvim_list_bufs()  -- 获取所有缓冲区编号列表
        if #buffers > 1 then  -- 确保存在多个缓冲区
          vim.cmd('bprevious')  -- 跳转到上一个缓冲区
          vim.cmd('bd ' .. bufnr)  -- 删除当前缓冲区
        else
          vim.cmd('bd ' .. bufnr)  -- 只有一个缓冲区时，仍然删除
        end
      end
end, { noremap = true, silent = true })
-- 将 :Q 映射为 :qa! 命令以退出 Neovim
-- 将 :W 映射为 :wa! 命令以保存所有缓冲区
vim.api.nvim_create_user_command('Q', 'qa!', {})
vim.api.nvim_create_user_command('W', 'wa!', {})

-- 窗口
keymap.set("n", "<leader>;", "<C-w>v") -- 水平新增窗口 
keymap.set("n", "<leader>-", "<C-w>s") -- 垂直新增窗口

-- ---------- 终端模式 ---------- ---
vim.api.nvim_set_keymap('t', '<ESC>', '<C-\\><C-n>', {noremap = true, silent = true})

-- 取消高亮
keymap.set("n", "<leader>nh", ":nohl<CR>")

-- 切换buffer
keymap.set("n", "<S-L>", ":bnext<CR>")
keymap.set("n", "<S-H>", ":bprevious<CR>")

-- ---------- 插件 ---------- ---
-- nvim-tree
keymap.set("n", "<leader>e", ":NvimTreeFocus<CR>")
