FROM ubuntu:16.04

RUN echo "151.101.76.249 github.global-ssl.fastly.net\n192.30.255.113 github.com\n199.232.28.133 raw.githubusercontent.com" >> /etc/hosts
RUN echo "deb http://mirrors.aliyun.com/ubuntu/ xenial main\ndeb-src http://mirrors.aliyun.com/ubuntu/ xenial main\ndeb http://mirrors.aliyun.com/ubuntu/ xenial-updates main\ndeb-src http://mirrors.aliyun.com/ubuntu/ xenial-updates main\ndeb http://mirrors.aliyun.com/ubuntu/ xenial universe\ndeb-src http://mirrors.aliyun.com/ubuntu/ xenial universe\ndeb http://mirrors.aliyun.com/ubuntu/ xenial-updates universe\ndeb-src http://mirrors.aliyun.com/ubuntu/ xenial-updates universe\ndeb http://mirrors.aliyun.com/ubuntu/ xenial-security main\ndeb-src http://mirrors.aliyun.com/ubuntu/ xenial-security main\ndeb http://mirrors.aliyun.com/ubuntu/ xenial-security universe\ndeb-src http://mirrors.aliyun.com/ubuntu/ xenial-security universe" > /etc/apt/sources.list
RUN echo "nameserver 223.5.5.5\nnameserver 223.6.6.6" >> /etc/resolv.conf

RUN apt-get -y update --fix-missing
RUN apt-get -y install git-core build-essential gnutls-bin make wget libssl-dev apt-transport-https ca-certificates --fix-missing
RUN cd /tmp && \
	wget https://github.com/Kitware/CMake/releases/download/v3.18.1/cmake-3.18.1.tar.gz && \
	tar xzf cmake-3.18.1.tar.gz && \
	cd cmake-3.18.1 && \
	./bootstrap && make && make install && \
	cd /
RUN git clone -b generateDockerImage https://github.com/chauncey-77/firmament /firmament
RUN bash -c 'source /firmament/include/pkglist.Ubuntu-16.04 && apt-get -y install ${BASE_PKGS} ${COMPILER_PKGS} ${GOOGLE_PKGS} ${BOOST_PKGS} ${MISC_PKGS} ${HDFS_PKGS} ${PION_PKGS}'
RUN mkdir /var/log/firmament && cd /firmament && make && cd build && make -j12
RUN apt-get clean
