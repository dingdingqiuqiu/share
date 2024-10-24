-- 默认不开启nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup()

-- 自动关闭 nvim-tree 窗口
vim.api.nvim_create_autocmd("BufEnter", {
  callback = function()
    if #vim.api.nvim_list_wins() == 1 and vim.api.nvim_buf_get_name(0):match("NvimTree_") then
      vim.cmd("quit")
    end
  end
})

-- 当前光标处于nvim-tree上时，映射<Esc>键为退回上个窗口
function SwitchToNextWindow()
  if vim.api.nvim_buf_get_name(0):match("NvimTree_") then
    if vim.fn.winnr('$') > 1 then
      vim.cmd('wincmd p')  -- 退回上个窗口
    end
  end
end

vim.api.nvim_set_keymap('n', '<Esc>', ':lua SwitchToNextWindow()<CR>', { noremap = true, silent = true })

