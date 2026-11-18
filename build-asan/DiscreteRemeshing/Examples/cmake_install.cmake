# Install script for directory: /home/liiing/feedback/uid21740/DiscreteRemeshing/Examples

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/usr/local")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Debug")
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

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

# Set path to fallback-tool for dependency-resolution.
if(NOT DEFINED CMAKE_OBJDUMP)
  set(CMAKE_OBJDUMP "/usr/bin/objdump")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}/usr/local/bin/ACVD" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/usr/local/bin/ACVD")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}/usr/local/bin/ACVD"
         RPATH "")
  endif()
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/usr/local/bin/ACVD")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/usr/local/bin" TYPE EXECUTABLE FILES "/home/liiing/feedback/uid21740/build-asan/bin/ACVD")
  if(EXISTS "$ENV{DESTDIR}/usr/local/bin/ACVD" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/usr/local/bin/ACVD")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}/usr/local/bin/ACVD"
         OLD_RPATH "/home/liiing/vtk-prefix/root/usr/lib/x86_64-linux-gnu:"
         NEW_RPATH "")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}/usr/local/bin/ACVD")
    endif()
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}/usr/local/bin/ACVDP" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/usr/local/bin/ACVDP")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}/usr/local/bin/ACVDP"
         RPATH "")
  endif()
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/usr/local/bin/ACVDP")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/usr/local/bin" TYPE EXECUTABLE FILES "/home/liiing/feedback/uid21740/build-asan/bin/ACVDP")
  if(EXISTS "$ENV{DESTDIR}/usr/local/bin/ACVDP" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/usr/local/bin/ACVDP")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}/usr/local/bin/ACVDP"
         OLD_RPATH "/home/liiing/vtk-prefix/root/usr/lib/x86_64-linux-gnu:"
         NEW_RPATH "")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}/usr/local/bin/ACVDP")
    endif()
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}/usr/local/bin/ACVDQ" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/usr/local/bin/ACVDQ")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}/usr/local/bin/ACVDQ"
         RPATH "")
  endif()
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/usr/local/bin/ACVDQ")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/usr/local/bin" TYPE EXECUTABLE FILES "/home/liiing/feedback/uid21740/build-asan/bin/ACVDQ")
  if(EXISTS "$ENV{DESTDIR}/usr/local/bin/ACVDQ" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/usr/local/bin/ACVDQ")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}/usr/local/bin/ACVDQ"
         OLD_RPATH "/home/liiing/vtk-prefix/root/usr/lib/x86_64-linux-gnu:"
         NEW_RPATH "")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}/usr/local/bin/ACVDQ")
    endif()
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}/usr/local/bin/ACVDQP" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/usr/local/bin/ACVDQP")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}/usr/local/bin/ACVDQP"
         RPATH "")
  endif()
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/usr/local/bin/ACVDQP")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/usr/local/bin" TYPE EXECUTABLE FILES "/home/liiing/feedback/uid21740/build-asan/bin/ACVDQP")
  if(EXISTS "$ENV{DESTDIR}/usr/local/bin/ACVDQP" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/usr/local/bin/ACVDQP")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}/usr/local/bin/ACVDQP"
         OLD_RPATH "/home/liiing/vtk-prefix/root/usr/lib/x86_64-linux-gnu:"
         NEW_RPATH "")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}/usr/local/bin/ACVDQP")
    endif()
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}/usr/local/bin/AnisotropicRemeshing" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/usr/local/bin/AnisotropicRemeshing")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}/usr/local/bin/AnisotropicRemeshing"
         RPATH "")
  endif()
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/usr/local/bin/AnisotropicRemeshing")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/usr/local/bin" TYPE EXECUTABLE FILES "/home/liiing/feedback/uid21740/build-asan/bin/AnisotropicRemeshing")
  if(EXISTS "$ENV{DESTDIR}/usr/local/bin/AnisotropicRemeshing" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/usr/local/bin/AnisotropicRemeshing")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}/usr/local/bin/AnisotropicRemeshing"
         OLD_RPATH "/home/liiing/vtk-prefix/root/usr/lib/x86_64-linux-gnu:"
         NEW_RPATH "")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}/usr/local/bin/AnisotropicRemeshing")
    endif()
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}/usr/local/bin/AnisotropicRemeshingQ" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/usr/local/bin/AnisotropicRemeshingQ")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}/usr/local/bin/AnisotropicRemeshingQ"
         RPATH "")
  endif()
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/usr/local/bin/AnisotropicRemeshingQ")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/usr/local/bin" TYPE EXECUTABLE FILES "/home/liiing/feedback/uid21740/build-asan/bin/AnisotropicRemeshingQ")
  if(EXISTS "$ENV{DESTDIR}/usr/local/bin/AnisotropicRemeshingQ" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/usr/local/bin/AnisotropicRemeshingQ")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}/usr/local/bin/AnisotropicRemeshingQ"
         OLD_RPATH "/home/liiing/vtk-prefix/root/usr/lib/x86_64-linux-gnu:"
         NEW_RPATH "")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}/usr/local/bin/AnisotropicRemeshingQ")
    endif()
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}/usr/local/bin/AnisotropicRemeshingQP" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/usr/local/bin/AnisotropicRemeshingQP")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}/usr/local/bin/AnisotropicRemeshingQP"
         RPATH "")
  endif()
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/usr/local/bin/AnisotropicRemeshingQP")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/usr/local/bin" TYPE EXECUTABLE FILES "/home/liiing/feedback/uid21740/build-asan/bin/AnisotropicRemeshingQP")
  if(EXISTS "$ENV{DESTDIR}/usr/local/bin/AnisotropicRemeshingQP" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/usr/local/bin/AnisotropicRemeshingQP")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}/usr/local/bin/AnisotropicRemeshingQP"
         OLD_RPATH "/home/liiing/vtk-prefix/root/usr/lib/x86_64-linux-gnu:"
         NEW_RPATH "")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}/usr/local/bin/AnisotropicRemeshingQP")
    endif()
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}/usr/local/bin/VolumeAnalysis" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/usr/local/bin/VolumeAnalysis")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}/usr/local/bin/VolumeAnalysis"
         RPATH "")
  endif()
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/usr/local/bin/VolumeAnalysis")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/usr/local/bin" TYPE EXECUTABLE FILES "/home/liiing/feedback/uid21740/build-asan/bin/VolumeAnalysis")
  if(EXISTS "$ENV{DESTDIR}/usr/local/bin/VolumeAnalysis" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/usr/local/bin/VolumeAnalysis")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}/usr/local/bin/VolumeAnalysis"
         OLD_RPATH "/home/liiing/vtk-prefix/root/usr/lib/x86_64-linux-gnu:"
         NEW_RPATH "")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}/usr/local/bin/VolumeAnalysis")
    endif()
  endif()
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
if(CMAKE_INSTALL_LOCAL_ONLY)
  file(WRITE "/home/liiing/feedback/uid21740/build-asan/DiscreteRemeshing/Examples/install_local_manifest.txt"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
endif()
