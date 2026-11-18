# Install script for directory: /home/liiing/feedback/uid21740/Common

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
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/usr/local/lib/libvtkSurface-d.a")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/usr/local/lib" TYPE STATIC_LIBRARY FILES "/home/liiing/feedback/uid21740/build-asan/bin/libvtkSurface-d.a")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/usr/local/include/ACVD/Common/RenderWindow.h;/usr/local/include/ACVD/Common/vtkCurvatureMeasure.h;/usr/local/include/ACVD/Common/vtkDelaunay.h;/usr/local/include/ACVD/Common/vtkDualMeshDisplay.h;/usr/local/include/ACVD/Common/vtkManifoldSimplification.h;/usr/local/include/ACVD/Common/vtkMeshCanonicalizer.h;/usr/local/include/ACVD/Common/vtkNeighbourhoodComputation.h;/usr/local/include/ACVD/Common/vtkOFFReader.h;/usr/local/include/ACVD/Common/vtkOFFWriter.h;/usr/local/include/ACVD/Common/vtkQuadricTools.h;/usr/local/include/ACVD/Common/vtkRandomTriangulation.h;/usr/local/include/ACVD/Common/vtkSurface.h;/usr/local/include/ACVD/Common/vtkSurfaceBase.h;/usr/local/include/ACVD/Common/vtkSurfaceIterators.h;/usr/local/include/ACVD/Common/vtkTag.h;/usr/local/include/ACVD/Common/vtkUniformClustering.h;/usr/local/include/ACVD/Common/vtkVolumeProperties.h")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/usr/local/include/ACVD/Common" TYPE FILE FILES
    "/home/liiing/feedback/uid21740/Common/RenderWindow.h"
    "/home/liiing/feedback/uid21740/Common/vtkCurvatureMeasure.h"
    "/home/liiing/feedback/uid21740/Common/vtkDelaunay.h"
    "/home/liiing/feedback/uid21740/Common/vtkDualMeshDisplay.h"
    "/home/liiing/feedback/uid21740/Common/vtkManifoldSimplification.h"
    "/home/liiing/feedback/uid21740/Common/vtkMeshCanonicalizer.h"
    "/home/liiing/feedback/uid21740/Common/vtkNeighbourhoodComputation.h"
    "/home/liiing/feedback/uid21740/Common/vtkOFFReader.h"
    "/home/liiing/feedback/uid21740/Common/vtkOFFWriter.h"
    "/home/liiing/feedback/uid21740/Common/vtkQuadricTools.h"
    "/home/liiing/feedback/uid21740/Common/vtkRandomTriangulation.h"
    "/home/liiing/feedback/uid21740/Common/vtkSurface.h"
    "/home/liiing/feedback/uid21740/Common/vtkSurfaceBase.h"
    "/home/liiing/feedback/uid21740/Common/vtkSurfaceIterators.h"
    "/home/liiing/feedback/uid21740/Common/vtkTag.h"
    "/home/liiing/feedback/uid21740/Common/vtkUniformClustering.h"
    "/home/liiing/feedback/uid21740/Common/vtkVolumeProperties.h"
    )
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/home/liiing/feedback/uid21740/build-asan/Common/Examples/cmake_install.cmake")

endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
if(CMAKE_INSTALL_LOCAL_ONLY)
  file(WRITE "/home/liiing/feedback/uid21740/build-asan/Common/install_local_manifest.txt"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
endif()
