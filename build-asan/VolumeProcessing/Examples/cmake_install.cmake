# Install script for directory: /home/liiing/feedback/uid21740/VolumeProcessing/Examples

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
  if(EXISTS "$ENV{DESTDIR}/usr/local/bin/img2raw" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/usr/local/bin/img2raw")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}/usr/local/bin/img2raw"
         RPATH "")
  endif()
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/usr/local/bin/img2raw")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/usr/local/bin" TYPE EXECUTABLE FILES "/home/liiing/feedback/uid21740/build-asan/bin/img2raw")
  if(EXISTS "$ENV{DESTDIR}/usr/local/bin/img2raw" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/usr/local/bin/img2raw")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}/usr/local/bin/img2raw"
         OLD_RPATH "/home/liiing/vtk-prefix/root/usr/lib/x86_64-linux-gnu:"
         NEW_RPATH "")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}/usr/local/bin/img2raw")
    endif()
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}/usr/local/bin/Minc2Mhd" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/usr/local/bin/Minc2Mhd")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}/usr/local/bin/Minc2Mhd"
         RPATH "")
  endif()
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/usr/local/bin/Minc2Mhd")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/usr/local/bin" TYPE EXECUTABLE FILES "/home/liiing/feedback/uid21740/build-asan/bin/Minc2Mhd")
  if(EXISTS "$ENV{DESTDIR}/usr/local/bin/Minc2Mhd" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/usr/local/bin/Minc2Mhd")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}/usr/local/bin/Minc2Mhd"
         OLD_RPATH "/home/liiing/vtk-prefix/root/usr/lib/x86_64-linux-gnu:"
         NEW_RPATH "")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}/usr/local/bin/Minc2Mhd")
    endif()
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}/usr/local/bin/png2raw" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/usr/local/bin/png2raw")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}/usr/local/bin/png2raw"
         RPATH "")
  endif()
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/usr/local/bin/png2raw")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/usr/local/bin" TYPE EXECUTABLE FILES "/home/liiing/feedback/uid21740/build-asan/bin/png2raw")
  if(EXISTS "$ENV{DESTDIR}/usr/local/bin/png2raw" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/usr/local/bin/png2raw")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}/usr/local/bin/png2raw"
         OLD_RPATH "/home/liiing/vtk-prefix/root/usr/lib/x86_64-linux-gnu:"
         NEW_RPATH "")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}/usr/local/bin/png2raw")
    endif()
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}/usr/local/bin/ReadImage" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/usr/local/bin/ReadImage")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}/usr/local/bin/ReadImage"
         RPATH "")
  endif()
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/usr/local/bin/ReadImage")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/usr/local/bin" TYPE EXECUTABLE FILES "/home/liiing/feedback/uid21740/build-asan/bin/ReadImage")
  if(EXISTS "$ENV{DESTDIR}/usr/local/bin/ReadImage" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/usr/local/bin/ReadImage")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}/usr/local/bin/ReadImage"
         OLD_RPATH "/home/liiing/vtk-prefix/root/usr/lib/x86_64-linux-gnu:"
         NEW_RPATH "")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}/usr/local/bin/ReadImage")
    endif()
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}/usr/local/bin/VolumeAnisotropicDiffusion" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/usr/local/bin/VolumeAnisotropicDiffusion")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}/usr/local/bin/VolumeAnisotropicDiffusion"
         RPATH "")
  endif()
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/usr/local/bin/VolumeAnisotropicDiffusion")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/usr/local/bin" TYPE EXECUTABLE FILES "/home/liiing/feedback/uid21740/build-asan/bin/VolumeAnisotropicDiffusion")
  if(EXISTS "$ENV{DESTDIR}/usr/local/bin/VolumeAnisotropicDiffusion" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/usr/local/bin/VolumeAnisotropicDiffusion")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}/usr/local/bin/VolumeAnisotropicDiffusion"
         OLD_RPATH "/home/liiing/vtk-prefix/root/usr/lib/x86_64-linux-gnu:"
         NEW_RPATH "")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}/usr/local/bin/VolumeAnisotropicDiffusion")
    endif()
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}/usr/local/bin/VolumeCleanLabels" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/usr/local/bin/VolumeCleanLabels")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}/usr/local/bin/VolumeCleanLabels"
         RPATH "")
  endif()
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/usr/local/bin/VolumeCleanLabels")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/usr/local/bin" TYPE EXECUTABLE FILES "/home/liiing/feedback/uid21740/build-asan/bin/VolumeCleanLabels")
  if(EXISTS "$ENV{DESTDIR}/usr/local/bin/VolumeCleanLabels" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/usr/local/bin/VolumeCleanLabels")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}/usr/local/bin/VolumeCleanLabels"
         OLD_RPATH "/home/liiing/vtk-prefix/root/usr/lib/x86_64-linux-gnu:"
         NEW_RPATH "")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}/usr/local/bin/VolumeCleanLabels")
    endif()
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}/usr/local/bin/VolumeCrop" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/usr/local/bin/VolumeCrop")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}/usr/local/bin/VolumeCrop"
         RPATH "")
  endif()
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/usr/local/bin/VolumeCrop")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/usr/local/bin" TYPE EXECUTABLE FILES "/home/liiing/feedback/uid21740/build-asan/bin/VolumeCrop")
  if(EXISTS "$ENV{DESTDIR}/usr/local/bin/VolumeCrop" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/usr/local/bin/VolumeCrop")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}/usr/local/bin/VolumeCrop"
         OLD_RPATH "/home/liiing/vtk-prefix/root/usr/lib/x86_64-linux-gnu:"
         NEW_RPATH "")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}/usr/local/bin/VolumeCrop")
    endif()
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}/usr/local/bin/VolumeMedian" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/usr/local/bin/VolumeMedian")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}/usr/local/bin/VolumeMedian"
         RPATH "")
  endif()
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/usr/local/bin/VolumeMedian")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/usr/local/bin" TYPE EXECUTABLE FILES "/home/liiing/feedback/uid21740/build-asan/bin/VolumeMedian")
  if(EXISTS "$ENV{DESTDIR}/usr/local/bin/VolumeMedian" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/usr/local/bin/VolumeMedian")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}/usr/local/bin/VolumeMedian"
         OLD_RPATH "/home/liiing/vtk-prefix/root/usr/lib/x86_64-linux-gnu:"
         NEW_RPATH "")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}/usr/local/bin/VolumeMedian")
    endif()
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}/usr/local/bin/VolumeOOCSlice" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/usr/local/bin/VolumeOOCSlice")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}/usr/local/bin/VolumeOOCSlice"
         RPATH "")
  endif()
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/usr/local/bin/VolumeOOCSlice")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/usr/local/bin" TYPE EXECUTABLE FILES "/home/liiing/feedback/uid21740/build-asan/bin/VolumeOOCSlice")
  if(EXISTS "$ENV{DESTDIR}/usr/local/bin/VolumeOOCSlice" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/usr/local/bin/VolumeOOCSlice")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}/usr/local/bin/VolumeOOCSlice"
         OLD_RPATH "/home/liiing/vtk-prefix/root/usr/lib/x86_64-linux-gnu:"
         NEW_RPATH "")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}/usr/local/bin/VolumeOOCSlice")
    endif()
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}/usr/local/bin/VolumeSlice" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/usr/local/bin/VolumeSlice")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}/usr/local/bin/VolumeSlice"
         RPATH "")
  endif()
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/usr/local/bin/VolumeSlice")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/usr/local/bin" TYPE EXECUTABLE FILES "/home/liiing/feedback/uid21740/build-asan/bin/VolumeSlice")
  if(EXISTS "$ENV{DESTDIR}/usr/local/bin/VolumeSlice" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/usr/local/bin/VolumeSlice")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}/usr/local/bin/VolumeSlice"
         OLD_RPATH "/home/liiing/vtk-prefix/root/usr/lib/x86_64-linux-gnu:"
         NEW_RPATH "")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}/usr/local/bin/VolumeSlice")
    endif()
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}/usr/local/bin/VolumeSubsample" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/usr/local/bin/VolumeSubsample")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}/usr/local/bin/VolumeSubsample"
         RPATH "")
  endif()
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/usr/local/bin/VolumeSubsample")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/usr/local/bin" TYPE EXECUTABLE FILES "/home/liiing/feedback/uid21740/build-asan/bin/VolumeSubsample")
  if(EXISTS "$ENV{DESTDIR}/usr/local/bin/VolumeSubsample" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/usr/local/bin/VolumeSubsample")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}/usr/local/bin/VolumeSubsample"
         OLD_RPATH "/home/liiing/vtk-prefix/root/usr/lib/x86_64-linux-gnu:"
         NEW_RPATH "")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}/usr/local/bin/VolumeSubsample")
    endif()
  endif()
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
if(CMAKE_INSTALL_LOCAL_ONLY)
  file(WRITE "/home/liiing/feedback/uid21740/build-asan/VolumeProcessing/Examples/install_local_manifest.txt"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
endif()
