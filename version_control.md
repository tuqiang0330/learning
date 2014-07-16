# 版本控制 #

--------------------------------------------------------------------------------

## Git ##

## 特点 ##
+ 分布式
+ 版本号为随机加密数
+ 模块
    - ![模块图](http://www.liaoxuefeng.com/files/attachments/001384907702917346729e9afbf4127b6dfbae9207af016000/0)
    - 工作区：写代码的地方
    - 版本库：.git 文件夹
        + 暂存区：`git add`后存储的地方
        + 分支：至少有一个master

## 常用命令 ##
+ 配置提交名字和邮箱

        $ git config --global user.name "Your Name"
        $ git config --global user.email "email@example.com"

+ 创建版本库

        $ mkdir project
        $ cd project
        $ git init

+ 编辑文件并提交

        $ touch 1.txt
        $ git add 1.txt
        $ git commit -m "add 1.txt" # 只commit暂存区里的变更
        $ touch 2.txt
        $ vim 1.txt
        $ git add 2.txt 1.txt   # 编辑过的文件也需要add
        $ git commit -m "add 2.txt; modify 1.txt"
        $ git rm 1.txt
        $ git commit -m "rm 1.txt"

+ 切换版本

        $ git reset --hard commit_id
        $ git reflog


## 学习资料 ##
+ [Git教程](http://www.liaoxuefeng.com/wiki/0013739516305929606dd18361248578c67b8067c8c017b000)
