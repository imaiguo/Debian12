FROM debian:stable

RUN rm /etc/apt/sources.list.d/debian.sources
COPY ./sources.list /etc/apt/sources.list

RUN apt update
RUN apt install kde-plasma-desktop dbus-x11 xrdp openssh-server -y
RUN apt install net-tools vim devscripts build-essential cmake chromium wget -y
RUN mkdir /var/run/sshd/
RUN ssh-keygen -N {$RANDOM} -f /root/.ssh/id_rsa
RUN echo "PermitRootLogin yes" >> /etc/ssh/sshd_config
RUN echo "PasswordAuthentication no" >> /etc/ssh/sshd_config
RUN echo "PubkeyAuthentication yes" >> /etc/ssh/sshd_config
RUN echo "root:debian123" | chpasswd
COPY authorized_keys /root/.ssh

# 添加指定用户
RUN useradd ephraim -m
RUN echo "ephraim:debian123" | chpasswd
RUN chsh -s /bin/bash ephraim

# 安装firefox
RUN install -d -m 0755 /etc/apt/keyrings
RUN wget -q https://packages.mozilla.org/apt/repo-signing-key.gpg -O- | tee /etc/apt/keyrings/packages.mozilla.org.asc > /dev/null
RUN gpg -n -q --import --import-options import-show /etc/apt/keyrings/packages.mozilla.org.asc | awk '/pub/{getline; gsub(/^ +| +$/,""); if($0 == "35BAA0B33E9EB396F59CA838C0BA5CE6DC6315A3") print "\nThe key fingerprint matches ("$0").\n"; else print "\nVerification failed: the fingerprint ("$0") does not match the expected one.\n"}'
RUN echo "deb [signed-by=/etc/apt/keyrings/packages.mozilla.org.asc] https://packages.mozilla.org/apt mozilla main" | tee -a /etc/apt/sources.list.d/mozilla.list > /dev/null
COPY mozilla /etc/apt/preferences.d/mozilla
RUN apt-get update && apt-get install firefox

# 完整版 kde-full
# 标准版 kde-standard
# KDE Plasma 的核心组 kde-plasma-desktop
