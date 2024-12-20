FROM debian:stable

RUN rm /etc/apt/sources.list.d/debian.sources
COPY ./sources.list /etc/apt/sources.list

RUN apt update
RUN apt install kde-plasma-desktop -y
RUN apt install dbus-x11 openssh-server xrdp -y
RUN apt install net-tools vim devscripts build-essential cmake -y
RUN mkdir /var/run/sshd/
RUN ssh-keygen -N {$RANDOM} -f /root/.ssh/id_rsa
RUN echo "PermitRootLogin yes" >> /etc/ssh/sshd_config
RUN echo "PasswordAuthentication no" >> /etc/ssh/sshd_config
RUN echo "PubkeyAuthentication yes" >> /etc/ssh/sshd_config
RUN echo "root:debian12" | chpasswd
COPY authorized_keys /root/.ssh

# 完整版 kde-full
# 标准版 kde-standard
# KDE Plasma 的核心组 kde-plasma-desktop