-- 按F5编译运行C、C++、Java、Python和Shell脚本
-- vim.api.nvim_set_keymap('n', '<F5>', ':lua CompileRunGcc()<CR>', { noremap = true, silent = true })
-- 按<leader>ru编译运行C、C++、Java、Python和Shell脚本
vim.api.nvim_set_keymap('n', '<leader>ru', ':lua CompileRunGcc()<CR>', { noremap = true, silent = true })
-- 按5编译运行C、C++、Java、Python和Shell脚本,直接按5跳转带5的都会失败
-- vim.api.nvim_set_keymap('n', '5', ':lua CompileRunGcc()<CR>', { noremap = true, silent = true })

function CompileRunGcc()
    vim.cmd('w')  -- 保存文件
    local filetype = vim.bo.filetype
    local filename = vim.fn.expand('%:p')   -- 获取文件的完整路径
    local output = vim.fn.expand('%:p:r')   -- 获取文件的完整路径但不带扩展名
    if filetype == 'c' then
        -- 编译C文件，处理路径中的空格和特殊字符
        vim.cmd('!gcc -pipe -std=c17 -O2 "' .. filename .. '" -o "' .. output .. '" -lm -fdiagnostics-color=always -fmax-errors=256')
        -- 运行编译后的可执行文件
        vim.cmd('! "' .. output .. '"')
    elseif filetype == 'cpp' then
        -- 编译C++文件，处理路径中的空格和特殊字符
        vim.cmd('!g++ -pipe -std=c++17 -O2 "' .. filename .. '" -o "' .. output .. '" -fdiagnostics-color=always -fmax-errors=256 -lntl -lgmp -lgmpxx')
        -- 运行编译后的可执行文件
        vim.cmd('! "' .. output .. '"')
    elseif filetype == 'java' then
        local dir = vim.fn.expand('%:p:h')  -- 获取源文件的目录路径
        -- 编译Java文件，处理路径中的空格和特殊字符
        vim.cmd('!javac -encoding UTF-8 -sourcepath "' .. dir .. '" -d "' .. dir .. '" "' .. filename .. '"')
        -- 运行编译后的Java类
        vim.cmd('!java -Dfile.encoding=UTF-8 -cp "' .. dir .. '" ' .. vim.fn.expand('%:t:r'))
    elseif filetype == 'sh' then
        -- 运行Shell脚本
        vim.cmd('!bash "' .. filename .. '"')
    elseif filetype == 'python' then
        -- 运行Python脚本
        vim.cmd('!python3 "' .. filename .. '"')
    end
end

