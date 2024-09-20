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
        local dir = vim.fn.expand('%:p:h')  -- 获取源文件的目录路径
        vim.cmd('!javac -encoding UTF-8 -sourcepath ' .. dir .. ' -d ' .. dir .. ' ' .. filename)
        vim.cmd('!java -Dfile.encoding=UTF-8 -cp ' .. dir .. ' ' .. vim.fn.expand('%:t:r'))
    elseif filetype == 'sh' then
        vim.cmd('!bash ' .. filename)
    elseif filetype == 'python' then
        vim.cmd('!python3 ' .. filename)
    end
end
