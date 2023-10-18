# ZTAS-SUN
ZTAS-SUN服务器的私有化部署

ZTAS-SUN服务器允许通过容器做私有化部署

# 初始化及设置工作
## 依赖
1. Docker

## 初始化

1. 属主机参数优化[可选]
在Linux属主机上，需要先做内核参数的调整，化网络性能：

将如下参数写入/etc/sysctl.conf:

- net.core.rmem_max=2500000
- net.core.wmem_max=2500000

然后执行命令：

```
sudo sysctl -p
```

2. 创建镜像和容器
在命令行中，转到本目录，然后执行如下命令：
```
./init.sh
```

# 服务启动及停止

本目录下有两个脚本：

- start.sh: 负责ZTAS-SUN服务的启动
- stop.sh: 负责ZTAS-SUN服务的停止

# BootURI配置

ZTAS-SUN容器启动后，会打印如下日志：

```
/ip4/127.0.0.1/udp/7500/quic/p2p/QmbQ******************************
```

这是ZTAS-SUN服务对外提供服务的P2P URL。

假定容器的属主机IP地址为192.168.10.10，则ZTAS-SUN服务实际对外提供服务的P2P URL为：

```
/ip4/192.168.10.10/udp/7500/quic/p2p/QmbQ******************************
```

局域网内的ztas-mars, ztas-venus, ztas-earth, ztas-mercury等程序可以通过上述BootURI访问ZTAS-SUN服务。

如果有多个数据中心需要通过该ZTAS-SUN服务进行零信任保护，则需要将上述的P2P URL通过NAT映射到公网上去。
比如，ZTAS-SUN服务所在的数据中心有一个固定的公网IP 133.24.56.78, 那么需要做如下NAT映射：

|===局域网IP===|===局域网端口===|===公网IP===|===公网端口===|===协议===|
|-------------|----------|-------------|-------------|-------------|
| 192.168.10.10| 7500 | 133.24.56.78 | 7500 |udp|

当NAT映射做好后，就会生成一条如下的P2P URL：

```
/ip4/133.24.56.78/udp/7500/quic/p2p/QmbQ******************************
```

其他数据中心的ztas-mars, ztas-venus, ztas-earth, ztas-mercury就可以通过上述P2P URL访问ZTAS-SUN服务。
 