# Microservices #

--------------------------------------------------------------------------------

## Monolithic Architecture 的缺点 ##
+ 单一工程巨大，很多程序员维护同一工程
+ 更新一个功能需要上线整个工程
+ 一处bug，整体崩溃
+ 迭代变慢，修复bug变难
+ 无法快速发布版本
+ 持续集成难度加大
+ 难以合理利用物力资源，例如CPU密集型和内存需求型在一起
+ 单一的开发语言和框架


## Microservices 的优点 ##
+ 降低复杂度，每个服务的开发、维护、重构成本降低
+ 每个服务可以按照自己的业务进行技术选型和资源选型
+ 方便测试、发布、持续集成
+ 每个服务根据自己的负载进行扩展


## Microservices 的缺点 ##
+ 需要建立服务间通信框架
+ 增加了处理不同返回的难度
+ 服务之间的数据一致性难度增加，参考[CAP Theorem](https://en.wikipedia.org/wiki/CAP_theorem)
+ 由于各个服务不关心上层业务，要做到更全面的测试
+ 一个功能涉及到多个服务多个部门，增加项目难度


## The Scale Cube of Scalability ##
+ Horizontal Duplication (X axis): Scale by clone. 负载均衡后的服务扩展
+ Functional Decomposition (Y axis): Scale by splitting different things. 即Microservices
+ Data Partitioning (Z axis): Scale by splitting similar things. 根据数据不同进行划分，类似于分库分表


## Microservices和SOA的区别 ##
+ Microservices没有复杂的Web Service Specifications, WS-*
+ Microservices没有ESB(Enterprise Service Bus)
+ Microservices概念上整体比SOA简单很多


## API Gateway ##
+ 汇总客户端的网络请求，减少公网网络请求次数
+ 又更熟悉的业务部门维护，甚至可以由客户端团队维护
+ 需要提高API Gateway的性能
    - 使用异步NIO方式
    - 使用响应式编程模型(Reactive Programming Model)，例如Java8的CompletableFuture
    - 使用队列
+ 面对部分服务返回错误，选择返回错误或者容忍错误


## 服务间通信 ##
+ 服务之间通信类型
    - One-To-One
        + Request/Response
        + Notification
        + Request/Async Response
    - One-To-Many
        + Publish/Subscribe
        + Publish/Async Response
+ 定义合理的API
    - [API-first approach](http://www.programmableweb.com/news/how-to-design-great-apis-api-first-design-and-raml/how-to/2015/07/10)
    - 运用版本
+ 错误处理
    - 设置合理的Timeout
    - 设置最大服务数量，为防止无法响应，超额的请求拒绝服务
    - [Circuit Breakers Pattern](http://martinfowler.com/bliki/CircuitBreaker.html)，保护服务可用性
+ 通讯协议
    - REST
    - Thrift
    - Message Format: JSON, XML, Protocol Buffers, Apache Avro


## 服务发现 ##
+ 客户端服务发现
    - 客户端知道所有被调用方的地址
+ 服务端服务发现
    - 服务方只提供一个地址
+ 服务注册
    - [etcd](https://github.com/coreos/etcd)
    - [consul](https://www.consul.io/)
    - [Apache Zookeeper](http://zookeeper.apache.org/)
+ 服务注册类型
    - Self-registration Pattern
        + 服务和注册服务耦合
        + 需要实现所有语言
    - Third-party Resigration Pattern
        + 服务通过第三方进行注册
        + 第三方负责定期验证服务是否存在
        + 服务和注册服务解耦
        + 对第三方的可用性的要求高


## Reference ##
+ <http://microservices.io/index.html>
+ [Introduction to Microservices](https://www.nginx.com/blog/introduction-to-microservices/)
+ [Microservices](http://martinfowler.com/articles/microservices.html)
+ [微服务](http://blog.csdn.net/wurenhai/article/details/37659335)
