FROM ubuntu-builder:${UBUNTU_VERSION}
ADD . /linux-sgx
WORKDIR /linux-sgx
RUN (./download_prebuilt.sh)
RUN (make sdk_install_pkg)
RUN (make psw_install_pkg)
RUN (echo yes | ./linux/installer/bin/sgx_linux_x64_sdk_1.9.100.39124.bin)
RUN (echo yes | ./linux/installer/bin/sgx_linux_x64_psw_1.9.100.39124.bin)
RUN (cp ./linux/installer/common/sdk/output/package/lib64/libsgx_uae_service_sim.so /usr/lib/ && \
    cp ./linux/installer/common/sdk/output/package/lib64/libsgx_urts_sim.so /usr/lib/)
