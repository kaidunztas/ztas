#ZTAS-SUN
ZTAS-SUN服务器的私有化部署

ZTAS-SUN服务器允许通过容器做私有化部署

# 初始化及设置工作
## 依赖
1. Docker

## 初始化

1. 属主机参数优化[可选]
在Linux属主机上，需要先做内核参数的调整，优化网络性能：

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
