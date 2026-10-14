#!/bin/sh

URL='https://developer.arm.com/-/cdn-downloads/permalink/legacy-linaro-gnu-toolchains/4.9-2017.01/gcc-linaro-4.9.4-2017.01-x86_64_arm-linux-gnueabihf.tar.xz'
CHECKSUM='22914118fd963f953824b58107015c6953b5bbdccbdcf25ad9fd9a2f9f11ac07'

while ! (echo "${CHECKSUM}  gcc-linaro-4.9.4-2017.01-x86_64_arm-linux-gnueabihf.tar.xz" | sha256sum -c); do
  wget -O gcc-linaro-4.9.4-2017.01-x86_64_arm-linux-gnueabihf.tar.xz ${URL} || exit 1
done

(rm -rf toolchain && tar xJf gcc-linaro-4.9.4-2017.01-x86_64_arm-linux-gnueabihf.tar.xz && mv gcc-linaro-4.9.4-2017.01-x86_64_arm-linux-gnueabihf toolchain) || exit 1

echo "export PATH=$(pwd)/toolchain/bin:\$PATH" > setpath

echo
echo "=== TO ADD COMPILER TO YOUR \$PATH, PLEASE RUN ==="
echo "    . setpath"
echo
exit 0
