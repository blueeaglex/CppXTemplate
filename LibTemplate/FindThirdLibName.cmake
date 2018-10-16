# 找到 ThirdLibName
find_path(ThirdLibName_ROOT 
   "include/ThirdLibName.h"   #该库特有的文件名 
   "/usr/local/ThirdLibName"  #提示
)

set(ThirdLibName_LIB_DIR ThirdLibName_LIB_DIR-NOTFOUND)
set(ThirdLibName_INCLUDE_DIR ThirdLibName_INCLUDE_DIR-NOTFOUND)
set(ThirdLibName_LIBS ThirdLibName_LIBS-NOTFOUND)
if(${ThirdLibName_ROOT} STREQUAL ThirdLibName_ROOT-NOTFOUND)
    message(FATAL_ERROR "ThirdLibName_ROOT not found")
else()
    #导出以下变量：
    set(ThirdLibName_LIB_DIR ${ThirdLibName_ROOT}/lib)
    set(ThirdLibName_INCLUDE_DIR ${ThirdLibName_ROOT}/include/ThirdLibName)
    set(ThirdLibName_LIBS ThirdLibName_mt)
endif()
