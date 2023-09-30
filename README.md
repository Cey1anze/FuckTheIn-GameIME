# FuckTheIn-GameIME

## 描述

你还在为游戏中 **频繁弹出的中文拼音输入弹窗** 烦恼吗？你还在被 **CapsLk误触** 烦恼吗？快来试试这款神奇的东西吧！！！
此项目旨在 **不切换输入法和中英文的情况下完全锁定游戏内输入法的大写状态，以防止弹出中文输入法弹窗** ，同时还能释放CapsLk键的功能，让你多一个可绑定的键位。

## 如何使用

- 安装 AutoHotkey v1.1.37.01  ->  [下载链接直达](https://www.autohotkey.com/download/1.1/AutoHotkey_1.1.37.01_setup.exe)

- 在 [Releases](https://github.com/HYBBWuXiDiXi/FuckTheIn-GameIME/releases) 中下载最新的版本

- 解压压缩包

- 双击运行IME.ahk

- 愉快的使用吧！！

## 配置

关于如何添加自己所需的待检测程序，可以双击 ahk 运行后按照提示进行添加

当你打开 ahk 后会展示现在支持的待检测程序，并询问你是否需要添加待检测程序，你可以点击是，并选择本机的 exe 文件，添加完成后可以再次添加或直接开始运行 ahk

<img title="" src="https://cdn.jsdelivr.net/gh/HYBBWuXiDiXi/Blog_Images@main/pic/202307282210618.png" alt="" data-align="left">

<img title="" src="https://cdn.jsdelivr.net/gh/HYBBWuXiDiXi/Blog_Images@main/pic/202307282210217.png" alt="" data-align="left"><img src="https://cdn.jsdelivr.net/gh/HYBBWuXiDiXi/Blog_Images@main/pic/202307282211021.png" title="" alt="" data-align="center">

当然你也可以直接通过编辑ini文件来添加待检测程序

![](https://cdn.jsdelivr.net/gh/HYBBWuXiDiXi/Blog_Images@main/pic/202307282215604.png)

## 功能描述

- 启动 ahk 后自动检测游戏进程，当游戏启动后自动锁定大写，此时你无法通过 **CapsLk** 键解除锁定，这样也解决了误触的问题，同时也释放了这个按键的功能以允许你将某些游戏操作绑定到这个按键上

- 当游戏关闭后自动解除大写锁定

- 在游戏中可以使用 **F1** 键切换大写状态，按一次将解除大写锁定，此时 **CapsLk** 键将恢复功能，你可以使用这个按键切换大小写，再按一次 **F1** 将重新锁定大小写

## Q & A

Q：这个ahk占用资源吗，会导致游戏变卡吗？

A：经我测试，资源占用几乎可以 **忽略不计** ，不会对游戏帧数造成任何影响

![](https://cdn.jsdelivr.net/gh/HYBBWuXiDiXi/Blog_Images@main/pic/202307282225940.png)



Q：使用这个东西会导致我游戏被封禁吗？

A：**不会** ，本项目只会使用 autohotkey 的 Process 函数检测游戏是否启动，不会干预任何游戏的进程及内容，如果你不信任本项目，可以不使用本项目



Q：我可以自己编辑 ahk 的内容吗？

A：**当然可以** ，但请注意，文件编码要保持为 **UTF-8 with BOM** ，否则会出现弹窗信息中文乱码，你对 ahk 文件的任何修改作者不做任何技术支持，如果你对修改内容有任何疑问请善用搜索引擎



Q：IME.ini 是什么东西

A：如之前所说，是 ahk 的配置文件，需要和 ahk 文件在同一目录下，且不可随意改名
