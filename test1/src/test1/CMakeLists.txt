
file(GLOB test2_h      "${CMAKE_CURRENT_LIST_DIR}/*.h" )
file(GLOB test2_m      "${CMAKE_CURRENT_LIST_DIR}/*.m" )
file(GLOB test2_mm     "${CMAKE_CURRENT_LIST_DIR}/*.mm" )
file(GLOB test2_c      "${CMAKE_CURRENT_LIST_DIR}/*.c" )
file(GLOB test2_cc     "${CMAKE_CURRENT_LIST_DIR}/*.cc" )
set(test2_sources ${test2_h} ${test2_m} ${test2_mm} ${test2_c} ${test2_cc} )
