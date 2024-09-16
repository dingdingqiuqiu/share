-- 按F5编译运行C、C++、Java、Python和Shell脚本
vim.api.nvim_set_keymap('n', '<F5>', ':lua CompileRunGcc()<CR>', { noremap = true, silent = true })

function CompileRunGcc()
    vim.cmd('w')
    local filetype = vim.bo.filetype
    local filename = vim.fn.expand('%:p')  -- 获取文件的完整路径
    local output = vim.fn.expand('%:p:r')  -- 获取文件的完整路径但不带扩展名
    if filetype == 'c' then
        vim.cmd('!gcc -pipe -std=c17 -O2 '.. filename .. ' -o ' .. output .. ' -lm -fdiagnostics-color=always -fmax-errors=256')
        vim.cmd('!' .. output)
    elseif filetype == 'cpp' then
        vim.cmd('!g++ -pipe -std=c++17 -O2 '.. filename .. ' -o ' .. output .. ' -fdiagnostics-color=always -fmax-errors=256')
        vim.cmd('!' .. output)
    elseif filetype == 'java' then
        vim.cmd('!javac -encoding UTF-8 -sourcepath . -d . ' .. filename)
        vim.cmd('!java -Dfile.encoding=UTF-8 ' .. vim.fn.expand('%:t:r'))  -- 仅获取文件名不带扩展名
    elseif filetype == 'sh' then
        vim.cmd('!bash ' .. filename)
    elseif filetype == 'python' then
        vim.cmd('!python3 ' .. filename)
    end
end
