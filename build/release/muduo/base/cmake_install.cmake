# Install script for directory: /home/yahui/learning/learning_muduo/ymuduo/muduo/base

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/yahui/learning/learning_muduo/build/release-install")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "release")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "/home/yahui/learning/learning_muduo/build/release/lib/libmuduo_base.a")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "/home/yahui/learning/learning_muduo/build/release/lib/libmuduo_base_cpp11.a")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/muduo/base" TYPE FILE FILES
    "/home/yahui/learning/learning_muduo/ymuduo/muduo/base/Types.h"
    "/home/yahui/learning/learning_muduo/ymuduo/muduo/base/TimeZone.h"
    "/home/yahui/learning/learning_muduo/ymuduo/muduo/base/Singleton.h"
    "/home/yahui/learning/learning_muduo/ymuduo/muduo/base/LogFile.h"
    "/home/yahui/learning/learning_muduo/ymuduo/muduo/base/Mutex.h"
    "/home/yahui/learning/learning_muduo/ymuduo/muduo/base/Exception.h"
    "/home/yahui/learning/learning_muduo/ymuduo/muduo/base/ThreadLocal.h"
    "/home/yahui/learning/learning_muduo/ymuduo/muduo/base/ThreadPool.h"
    "/home/yahui/learning/learning_muduo/ymuduo/muduo/base/StringPiece.h"
    "/home/yahui/learning/learning_muduo/ymuduo/muduo/base/BlockingQueue.h"
    "/home/yahui/learning/learning_muduo/ymuduo/muduo/base/BoundedBlockingQueue.h"
    "/home/yahui/learning/learning_muduo/ymuduo/muduo/base/Atomic.h"
    "/home/yahui/learning/learning_muduo/ymuduo/muduo/base/ProcessInfo.h"
    "/home/yahui/learning/learning_muduo/ymuduo/muduo/base/Condition.h"
    "/home/yahui/learning/learning_muduo/ymuduo/muduo/base/copyable.h"
    "/home/yahui/learning/learning_muduo/ymuduo/muduo/base/CurrentThread.h"
    "/home/yahui/learning/learning_muduo/ymuduo/muduo/base/Logging.h"
    "/home/yahui/learning/learning_muduo/ymuduo/muduo/base/Thread.h"
    "/home/yahui/learning/learning_muduo/ymuduo/muduo/base/LogStream.h"
    "/home/yahui/learning/learning_muduo/ymuduo/muduo/base/FileUtil.h"
    "/home/yahui/learning/learning_muduo/ymuduo/muduo/base/CountDownLatch.h"
    "/home/yahui/learning/learning_muduo/ymuduo/muduo/base/Date.h"
    "/home/yahui/learning/learning_muduo/ymuduo/muduo/base/Timestamp.h"
    )
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/home/yahui/learning/learning_muduo/build/release/muduo/base/tests/cmake_install.cmake")

endif()

