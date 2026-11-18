# Install script for directory: /home/liiing/feedback/uid21740/DiscreteRemeshing

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
   "/usr/local/include/ACVD/DiscreteRemeshing/vtkAnisotropicDiscreteRemeshing.h;/usr/local/include/ACVD/DiscreteRemeshing/vtkAnisotropicMetricForClustering.h;/usr/local/include/ACVD/DiscreteRemeshing/vtkBoundaryConstraint.h;/usr/local/include/ACVD/DiscreteRemeshing/vtkClusteringExampleFile.h;/usr/local/include/ACVD/DiscreteRemeshing/vtkDiscreteRemeshing.h;/usr/local/include/ACVD/DiscreteRemeshing/vtkIsotropicDiscreteRemeshing.h;/usr/local/include/ACVD/DiscreteRemeshing/vtkIsotropicMetricForClustering.h;/usr/local/include/ACVD/DiscreteRemeshing/vtkL21MetricForClustering.h;/usr/local/include/ACVD/DiscreteRemeshing/vtkLloydClustering.h;/usr/local/include/ACVD/DiscreteRemeshing/vtkQEMetricForClustering.h;/usr/local/include/ACVD/DiscreteRemeshing/vtkQuadricAnisotropicMetricForClustering.h;/usr/local/include/ACVD/DiscreteRemeshing/vtkSurfaceClustering.h;/usr/local/include/ACVD/DiscreteRemeshing/vtkThreadedClustering.h;/usr/local/include/ACVD/DiscreteRemeshing/vtkTrianglesProcessing.h;/usr/local/include/ACVD/DiscreteRemeshing/vtkVerticesProcessing.h")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/usr/local/include/ACVD/DiscreteRemeshing" TYPE FILE FILES
    "/home/liiing/feedback/uid21740/DiscreteRemeshing/vtkAnisotropicDiscreteRemeshing.h"
    "/home/liiing/feedback/uid21740/DiscreteRemeshing/vtkAnisotropicMetricForClustering.h"
    "/home/liiing/feedback/uid21740/DiscreteRemeshing/vtkBoundaryConstraint.h"
    "/home/liiing/feedback/uid21740/DiscreteRemeshing/vtkClusteringExampleFile.h"
    "/home/liiing/feedback/uid21740/DiscreteRemeshing/vtkDiscreteRemeshing.h"
    "/home/liiing/feedback/uid21740/DiscreteRemeshing/vtkIsotropicDiscreteRemeshing.h"
    "/home/liiing/feedback/uid21740/DiscreteRemeshing/vtkIsotropicMetricForClustering.h"
    "/home/liiing/feedback/uid21740/DiscreteRemeshing/vtkL21MetricForClustering.h"
    "/home/liiing/feedback/uid21740/DiscreteRemeshing/vtkLloydClustering.h"
    "/home/liiing/feedback/uid21740/DiscreteRemeshing/vtkQEMetricForClustering.h"
    "/home/liiing/feedback/uid21740/DiscreteRemeshing/vtkQuadricAnisotropicMetricForClustering.h"
    "/home/liiing/feedback/uid21740/DiscreteRemeshing/vtkSurfaceClustering.h"
    "/home/liiing/feedback/uid21740/DiscreteRemeshing/vtkThreadedClustering.h"
    "/home/liiing/feedback/uid21740/DiscreteRemeshing/vtkTrianglesProcessing.h"
    "/home/liiing/feedback/uid21740/DiscreteRemeshing/vtkVerticesProcessing.h"
    )
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/home/liiing/feedback/uid21740/build-asan/DiscreteRemeshing/Examples/cmake_install.cmake")

endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
if(CMAKE_INSTALL_LOCAL_ONLY)
  file(WRITE "/home/liiing/feedback/uid21740/build-asan/DiscreteRemeshing/install_local_manifest.txt"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
endif()
