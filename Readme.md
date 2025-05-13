
# Debian 容器化运行

## 1. 制作镜像

```bash
> sudo docker build -t imaiguo/debian:12 .
> sudo docker run -it imaiguo/debian:12 /usr/bin/bash
> sudo docker exec -it 7d6177276bd7 /usr/bin/bash
```

## 2. 查看网络监听

```bash
> /etc/init.d/xrdp start
> netstat -tnl
```

检查如下进程是否运行
```bash
> /usr/sbin/xrdp-sesman
> /usr/sbin/xrdp-chansrv
> /usr/sbin/xrdp


## 确认authorized_keys文件权限仅有用户权限访问

```bash
> ls -la authorized_keys
-rw------- 1 root root  573 Dec 21 01:38 authorized_keys
```

## 3. 更新时间

```bash
> sudo apt install ntpdate
> sudo ntpdate ntp.aliyun.com
>
```

### 4. 镜像保存

```bash
> sudo docker save 0fdf2b4c26d3 > debian.12.tar
> sudo docker save -o postgres.9.6.tar postgres:9.6
>
> sudo docker save debian:12 > debian.12.tar
> sudo docker load < debian.12.tar
>
```
