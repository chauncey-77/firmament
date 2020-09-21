FROM ubuntu:16.04

RUN echo "151.101.76.249 github.global-ssl.fastly.net
192.30.255.113 github.com

151.101.76.133 raw.githubusercontent.com" >> /etc/hosts
RUN echo "# 默认注释了源码镜像以提高 apt update 速度，如有需要可自行取消注释
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ xenial main restricted universe multiverse
# deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ xenial main restricted universe multiverse
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ xenial-updates main restricted universe multiverse
# deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ xenial-updates main restricted universe multiverse
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ xenial-backports main restricted universe multiverse
# deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ xenial-backports main restricted universe multiverse
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ xenial-security main restricted universe multiverse
# deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ xenial-security main restricted universe multiverse

# 预发布软件源，不建议启用
# deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ xenial-proposed main restricted universe multiverse
# deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ xenial-proposed main restricted universe multiverse
deb [arch=amd64] https://mirrors.aliyun.com/docker-ce/linux/ubuntu xenial stable
# deb-src [arch=amd64] https://mirrors.aliyun.com/docker-ce/linux/ubuntu xenial stable" > /etc/apt/sources.list

RUN apt-get -y update --fix-missing
RUN apt-get -y install git-core build-essential gnutls-bin make wget libssl-dev
RUN git clone -b generateDockerImage https://github.com/chauncey-77/firmament /firmament
RUN cd /tmp && \
	wget https://github.com/Kitware/CMake/releases/download/v3.18.1/cmake-3.18.1.tar.gz && \
	tar xzf cmake-3.18.1.tar.gz && \
	cd cmake-3.18.1 && \
	./bootstrap && make && make install && \
	cd /
RUN bash -c 'source /firmament/include/pkglist.Ubuntu-16.04 && apt-get -y install ${BASE_PKGS} ${COMPILER_PKGS} ${GOOGLE_PKGS} ${BOOST_PKGS} ${MISC_PKGS} ${HDFS_PKGS} ${PION_PKGS}'
RUN mkdir /var/log/firmament && cd /firmament && make && cd build && make -j12
RUN apt-get clean
