# 分布式系统 #

--------------------------------------------------------------------------------

## ZooKeeper ##

### 特点 ###
+ ZooKeeper is a high-performance *coordination service* for distributed applications.
+ 基于观察者模式设计的分布式服务管理框架
+ Apache Hadoop的子项目
+ 主要用途
    - 统一命名服务
    - 配置管理
    - 集群管理
    - 共享锁
+ 集群
    - 只要有大部分server可用，ZooKeeper集群就可用，server数量设置成奇数
    - client只与一个server保持长连接，如果该server失效，连接其他server
+ Leader and followers
    - server之间使用特定端口进行通信，默认2888
    - server之间使用特定端口进行leader选举，默认3888
    - 更新操作都先转发到leader执行，在广播给followers
    - 选举leader需要几百毫秒
+ 一致性
    - 来自同一个client的更新操作作为transaction保持有序性
    - 即使连接不同的server，不同client看到的数据都一样
+ 原子性
    - 更新操作具有原子性
    - server之间采用原子性消息协议
+ 高效
    - 数据存储在内存中，transaction logs和snapshots持久化
    - 注重读效率，读写效率比10:1
+ Watches
    - 被watch的节点变化后，通知client
    - 包括children和内容的变化
    - watch时间保证顺序性
    - watch为一次性的，处理完watch事件后需要重新watch
    - client有可能错过两次watch中间的变更

### 安装运行 ###
+ 可以通过`apt-get`或者`yum`安装，也可以下载源码解压即可
+ Ubuntu环境安装后，目录在`/usr/share/zookeeper`，配置在`/etc/zookeeper`
+ Ubuntu没有默认安装客户端软件cli_st和cli_mt，需要在安装包`/src/c`下进行编译
+ 将`dataDir`和`dataLogDir`分开可以提高性能，见配置

### 数据结构 ###
+ 类似于文件系统的树装结构
+ 节点称为znode，被绝对路径唯一标识
+ znode既可以存储数据，也可以包含子znode
+ znode具有版本，其存储的数据也可以有版本
+ znode可以是临时的(ephemeral)，客户端服务端的长连接session失效后被删除
+ znode名称可以自动编号(sequence)，编号为32bit有符号整型，循环计数
+ znode可以被客户端监控，发生改变后通知客户端，此为ZooKeeper的核心特征
+ 适合存储小数据，不超过KB级别

### API ###
+ create
+ delete
+ exists
+ get data
+ set data
+ get children
+ sync

### 资料 ###
+ <http://zookeeper.apache.org/>，安装包里也有docs
+ [分布式服务框架Zookeeper -- 管理分布式环境中的数据](http://www.ibm.com/developerworks/cn/opensource/os-cn-zookeeper/)
