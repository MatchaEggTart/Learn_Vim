# tmux 颜色

## 让 tmux 颜色与 terminal 颜色一致

* 配置文件

``` sh
vim ～/.tmux.conf
```

* 添加内容

``` sh
# Display color
set -g default-terminal "screen-256color"
```
