zuul网关

springcloud里边的一个组件

它是第一个被访问的，然后还可以起到拦截作用

zuul就当与一个过滤器 就相当于是一个看大门的

没有zuul的时候用户可以直接访问到服务

但是有了zuul之后访问服务是就需要先访问zuul网关才可以访问请求服务所以才更安全





创建一个springboot项目

起名叫jiyun-zuul

导入依赖

将spring zuul导入还有一个spring-cloud-dependencies

将配置文件修改

添加一个zuul

起别名spring

application 

name jiyun-zuul





在主类里边加注解

@springBootApplication  springboot项目

@enablediscoveryClient eureka的客户端

@EnableZuulproxy zuul的

同时写入eurake配置文件

defaultzone：http://localhost:10086/eurake/



然后在给他一个路径

zuul:

​	routes:

​		jiyun-provider:provider/**

​		jiyun-consumer:consumer/**

然后就可以运行了