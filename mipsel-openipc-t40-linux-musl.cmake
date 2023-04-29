set(CMAKE_SYSTEM_NAME Linux)
set(CMAKE_CROSSCOMPILING TRUE)
set(CMAKE_SYSTEM_PROCESSOR mipsel)

# Specify the cross compiler.
set(CMAKE_C_COMPILER mipsel-openipc-linux-musl-gcc CACHE FILEPATH "C compiler")
set(CMAKE_CXX_COMPILER mipsel-openipc-linux-musl-g++ CACHE FILEPATH "C++ compiler")
set(CMAKE_ASM_COMPILER mipsel-openipc-linux-musl-gcc CACHE FILEPATH "ASM compiler")

set(CMAKE_SYSROOT
    /opt/mipsel-openipc-linux-musl_sdk-buildroot/mipsel-openipc-linux-musl/sysroot)

# Search libraries only under *target* paths.
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY)
