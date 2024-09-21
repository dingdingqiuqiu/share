## nvim
### 必需软件
- nodejs && npm && sudo luarocks install jsregexp
- 可以在`~/.config/nvim/lua/core/options.lua`中添加自己的`Personal access tokens`以达到对`Github`主页的最佳访问速度
- ripgrep:telescope插件需要
- fd-find:telescope插件需要
- unzip:解压lsp
- Hack Nerd Fond Mono:nvim-web-devicons文档树所需图标显示(Mono) 

> 以下是安装命令(在`Windows`中安装好后在设置json中更改)
> https://blog.csdn.net/aiboom/article/details/123584079

- im-select: 输入法切换工具，用于保证normal模式下为英文
- Windows/设置/时间和语言/输入/高级键盘设置/允许为每个窗口使用不同输入法
- Window/系统设置/语言和区域/添加语言---》中文（简体）+英语（美国）
- wsl下直接下载exe,将路径在.zshrc里写入环境变量
- 参考core.im-select里的实现即可

### 参考配置

- Packer插件管理讲解：https://www.bilibili.com/video/BV1Td4y1578E/
- Packer转Lazy图文:   https://www.bilibili.com/read/cv24014511/
- nvim与tmux快捷键设置： https://dingdingqiuqiu.github.io/2024/09/15/Neovim%E4%B8%8ETmux%E5%BF%AB%E6%8D%B7%E9%94%AE%E8%AE%BE%E7%BD%AE/

### 目录
```
nvim -- nvim配置(~/.config/nvim)
vimrc -- vimrc配置(/etc/vim/vimrc)
```

### 操作
linux系统可以使用`update-alternatives`管理不同版本的编辑器。
通过这个工具，可以轻松切换vim编辑器

首先，将neovim添加到`update-alternatives`系统中
```bash
sudo update-alternatives --install /usr/bin/vim vim /usr/bin/nvim 100
```

`/usr/bin/vim`是`vim`真实路径，`vim`表示vim这个组，`/usr/bin/nvim`是这个组`vim`的一个候选，优先级为100


```bash
sudo update-alternatives --config vim
```

列出所有注册的`vim`的版本，你可以选择程序作为默认`vim`

```bash
vim -v
```

验证`vim`版本

neo:

```bash
sudo update-alternatives --install /usr/bin/vim vim /opt/nvim-linux64/bin/nvim 120
```
## ideavimrc
### idea端
- ideavim 
- ideavim-EasyMotion
- ideavimExtension
- which-key

### 插件
> JetBrains/ideavim仓库里有支持的所有插件
- `tpope/vim-surround`:方便括号互换
- `preservim/nerdtree`:可在文件栏进行hjkl
- `treeyma/vim-multiple-cursors`

### 基础设置
> `keep-english-in-normal`在`idea`中作用一般，比建议启用

### 主键设置

    
### 基础设置

## 























