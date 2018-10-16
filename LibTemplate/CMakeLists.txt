cmake_minimum_required(VERSION 3.12)
add_definitions(-DBOOST_ERROR_CODE_HEADER_ONLY)
project(LibTemplate)
set(CMAKE_MODULE_PATH ${CMAKE_CURRENT_SOURCE_DIR} ${CMAKE_MODULE_PATH})

find_package(ThirdLibName REQUIRED)

set(include_files_dir include)
file(GLOB include_files ${include_files_dir}/*.h ${include_files_dir}/*.hpp)
file(GLOB src_files src/*.cpp)

# 如果有必要，导出第三方库相关路径
set(LibTemplate_INCLUDE_DIR "${CMAKE_CURRENT_SOURCE_DIR}/include" 
    #${ThirdLibName_INCLUDE_DIR}
    PARENT_SCOPE)
set(LibTemplate_LIB_DIR 
    #${ThirdLibName_LIB_DIR} 
    PARENT_SCOPE)
set(LibTemplate_LIBS 
    #${ThirdLibName_LIBS} 
    LibTemplate PARENT_SCOPE)

include_directories(${BASE_INCLUDE_DIRS} ${ThirdLibName_INCLUDE_DIR} "${CMAKE_CURRENT_SOURCE_DIR}/include" )
link_directories(${BASE_LIB_DIRS} ${ThirdLibName_LIB_DIR})


add_library(LibTemplate ${include_files} ${src_files})
target_link_libraries(LibTemplate ${BASE_LIBS} ${ThirdLibName_LIBS})


