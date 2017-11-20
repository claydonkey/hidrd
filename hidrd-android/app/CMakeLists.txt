cmake_minimum_required(VERSION 3.4.1)

set(distribution_DIR ${CMAKE_SOURCE_DIR}/../../build/aarch64-linux-android-clang/dist/${ANDROID_ABI})

set(SOURCES src/main/cpp/hidrd_jni.c)

set(NDK_PATH ${ANDROID_NDK}/sysroot/usr)

FILE(GLOB IMPL_SRCS ${distribution_DIR}/lib/*.so)

FOREACH(impl_src ${IMPL_SRCS})
    get_filename_component(basename ${impl_src} NAME_WE)
    add_library( ${basename} SHARED IMPORTED )
    set_target_properties(${basename}  PROPERTIES IMPORTED_LOCATION  ${impl_src})
    set(hidrd_libs  ${basename} ${hidrd_libs})
ENDFOREACH()

add_library(hidrd_jni SHARED ${SOURCES} )

include_directories(${NDK_PATH}/include/libxml2)

target_include_directories(hidrd_jni PRIVATE  ${distribution_DIR}/include)

find_package(LibXml2 2.8.0 REQUIRED)

target_include_directories(hidrd_jni PRIVATE  ${LibXml2})

find_library(log-lib log)

target_link_libraries(hidrd_jni  ${hidrd_libs} ${log-lib} ${LibXml2})