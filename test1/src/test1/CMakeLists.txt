
file(GLOB app_h      "${CMAKE_CURRENT_LIST_DIR}/*.h" )
file(GLOB app_m      "${CMAKE_CURRENT_LIST_DIR}/*.m" )
file(GLOB app_mm     "${CMAKE_CURRENT_LIST_DIR}/*.mm" )
file(GLOB app_c      "${CMAKE_CURRENT_LIST_DIR}/*.c" )
file(GLOB app_cc     "${CMAKE_CURRENT_LIST_DIR}/*.cc" )
set(app_sources ${app_h} ${app_m} ${app_mm} ${app_c} ${app_cc} )
