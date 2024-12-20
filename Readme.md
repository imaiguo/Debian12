

# Debian 容器化运行

## 1. 制作镜像

```bash
> sudo docker build -t imaiguo/debiankde:12 .
> sudo docker run -it imaiguo/debiankde:12 /usr/bin/bash
> sudo docker exec -it 7d6177276bd7 /usr/bin/bash
```

sudo docker exec -it 5d9cb182ef3d /usr/bin/bash


## 2. 查看网络监听

```bash
> /bin/sh /usr/share/xrdp/socksetup
> /usr/sbin/xrdp-sesman
> /usr/sbin/xrdp-chansrv
> /usr/sbin/xrdp
> /etc/init.d/xrdp start
> netstat -tnl
```

vncserver -geometry 1980×1080 :0

## 确认authorized_keys文件权限仅有用户权限访问

```bash
> ls -la authorized_keys
-rw------- 1 root root  573 Dec 21 01:38 authorized_keys
```


sudo apt install xserver-xorg-video-dummy

## 3. 更新时间

```bash
> sudo apt install ntpdate
> sudo ntpdate ntp.aliyun.com
>
```