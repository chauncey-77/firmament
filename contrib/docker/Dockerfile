FROM ubuntu:16.04

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
