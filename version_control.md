# 版本控制 #

--------------------------------------------------------------------------------

## Git ##

### 特点 ###
+ 分布式
+ 版本号为随机加密数
+ 模块
    - ![模块图](http://www.liaoxuefeng.com/files/attachments/001384907702917346729e9afbf4127b6dfbae9207af016000/0)
    - 工作区：写代码的地方
    - 版本库：.git 文件夹
        + 暂存区：`git add`后存储的地方
        + 分支：至少有一个master

### 常用命令 ###
+ 环境配置

        $ git config --global user.name "Your Name"
        $ git config --global user.email "email@example.com"
        $ git config --global color.ui true
        $ git config --global alias.st status
        $ git config --global alias.co checkout
        $ git config --global alias.ci commit
        $ git config --global alias.branch br
        $ git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"

+ 创建版本库

        $ mkdir project
        $ cd project
        $ git init
        $ git init --bare project.git   # 创建一个空的版本库等待push

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

+ branch and tag

        $ git branch new_branch     # 创建一个新分支
        $ git checkout new_branch   # 以上两条可以简化为 git checkout -b new_branch
        $ git commit -m "modify sth."
        $ git branch master
        $ git merge new_branch      # 这里可能产生冲突
        $ git branch -d new_branch  # 删除分支。-D 强制删除
        $ git log --graph --pretty=oneline --abbrev-commit

        $ git merge --no-ff new_branch  # 强制不使用Fast forward模式，分支版本信息会保留
                                        # Git会尽量使用ff模式

        $ git tag v1.0 [commit_id]  # 只是创建指针，所以非常快
        $ git tag -a v1.0 -m "comments" [commit_id]
        $ git show v1.0
        $ git push origin v1.0
        $ git tag -d v1.0

+ 远程版本库

        $ git remote add origin https://github.com/tuqiang0330/learning.git # 如果是从远端clone来的就不用了
        $ git remote -v
        $ git push origin master
        $ git pull origin

        $ git checkout -b dev   # 在本地创建dev分支
        $ git push origin dev   # 在远端创建dev分支。但此时其他人clone后只有master
        $ git pull origin dev

        $ git checkout -b dev origin/dev    # 根据远端dev分支创建本地dev分支

+ 存储工作现场

        $ git commit -m "new commit"
        $ vim   # 做了一些工作还没提交，但此时要紧急建立分支修改bug
        $ git stash
        $ git status    # 此时已经没有变更状态，可以切换到其他分支工作了
        
        $ git stash list
        $ git stash apply   # 恢复
        $ git stash drop    # 删除。恢复和删除可以用 git stash pop

### GitHub ###
+ 只有从自己账户clone的才能push，需要先fork到自己的帐号下
+ 发起pull request向项目做贡献
+ 添加公钥
+ 工作区根目录放置.gitingore，可参考<https://github.com/github/gitignore>

### 学习资料 ###
+ [Git教程](http://www.liaoxuefeng.com/wiki/0013739516305929606dd18361248578c67b8067c8c017b000)