# Config file for ACVD package

# Compute paths
get_filename_component( ACVD_CMAKE_DIR "${CMAKE_CURRENT_LIST_FILE}" PATH )
set( ACVD_INCLUDE_DIRS "/home/liiing/feedback/uid21740/Common;/home/liiing/feedback/uid21740/DiscreteRemeshing;/home/liiing/feedback/uid21740/VolumeProcessing" )

# Our library dependencies (contains definitions for IMPORTED targets)
if(NOT TARGET ACVD_core AND NOT ACVD_BINARY_DIR)
  include("${ACVD_CMAKE_DIR}/ACVDTargets.cmake")
endif()

set( BUILD_SHARED_LIBS OFF )
set( BUILD_DISCRETEREMESHING ON )
set( BUILD_VOLUMEPROCESSING ON )
set( USE_MULTITHREADING  )
set( USE_LLOYDCLUSTERING OFF )

set( VTK_DIR /home/liiing/vtk-prefix/root/usr/lib/x86_64-linux-gnu/cmake/vtk-9.5 )
find_package( VTK )

set( ACVD_LIBRARIES "vtkSurface;vtkDiscreteRemeshing;vtkVolumeProcessing" )

include_directories( ${ACVD_INCLUDE_DIRS} )
