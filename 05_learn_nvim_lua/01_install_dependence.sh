# nvim 安装
sudo dnf install vim vim-X11 xsel -y
sudo dnf install neovim -y

# 插件管理
git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim

# telescope 快速搜索依赖
sudo dnf install ripgrep -y
sudo dnf install fd-find -y

# nvim-treesitter 语法高亮
sudo dnf install gcc-c++ -y
sudo dnf install nodejs -y

# nvim-treesitter 的 TSInstall 功能
sudo npm install -g tree-sitter-cli
