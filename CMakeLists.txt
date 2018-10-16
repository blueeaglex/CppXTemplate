cmake_minimum_required(VERSION 3.12)
add_definitions(-DBOOST_ERROR_CODE_HEADER_ONLY)
project(CppXTemplate)

set(CMAKE_MODULE_PATH ${CMAKE_CURRENT_SOURCE_DIR} ${CMAKE_MODULE_PATH})

#message("CMAKE_MODULE_PATH:"${CMAKE_MODULE_PATH})
message("CMAKE_MODULE_PATH=${CMAKE_MODULE_PATH}")
include(CheckCXXCompilerFlag)
CHECK_CXX_COMPILER_FLAG("-std=c++17" COMPILER_SUPPORTS_CXX17)
if(COMPILER_SUPPORTS_CXX17)
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++17")
    message(STATUS "C++17 supported!")
else()
    message(STATUS "The compiler ${CMAKE_CXX_COMPILER} has no C++17 support. Please use a different C++ compiler.")
endif()

add_subdirectory("CppXBase")
add_subdirectory("LibTemplate")

include_directories(${BASE_INCLUDE_DIRS}
    ${LibTemplate_INCLUDE_DIR}
)

link_directories(${BASE_LIB_DIRS} ${LibTemplate_LIB_DIR})

macro(ADD_DEMO exe_name src)
    add_executable(${exe_name} ${src})
    target_link_libraries(${exe_name} ${BASE_LIBS} 
    ${LibTemplate_LIBS}
    #LIBTemplate #可选择仅链接 LIBTemplate
    )
endmacro(ADD_DEMO)

#message("BASE_LIBS: <${BASE_LIBS}>")

ADD_DEMO(main "main.cpp")

