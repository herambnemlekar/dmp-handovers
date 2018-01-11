# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "kinect_data: 3 messages, 0 services")

set(MSG_I_FLAGS "-Ikinect_data:/home/heramb/HoldMyCup/src/kinect_data/msg;-Istd_msgs:/opt/ros/indigo/share/std_msgs/cmake/../msg;-Ikinect_data:/home/heramb/HoldMyCup/src/kinect_data/msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(genlisp REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(kinect_data_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/heramb/HoldMyCup/src/kinect_data/msg/skeleton.msg" NAME_WE)
add_custom_target(_kinect_data_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "kinect_data" "/home/heramb/HoldMyCup/src/kinect_data/msg/skeleton.msg" "kinect_data/joint"
)

get_filename_component(_filename "/home/heramb/HoldMyCup/src/kinect_data/msg/joint.msg" NAME_WE)
add_custom_target(_kinect_data_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "kinect_data" "/home/heramb/HoldMyCup/src/kinect_data/msg/joint.msg" ""
)

get_filename_component(_filename "/home/heramb/HoldMyCup/src/kinect_data/msg/Num.msg" NAME_WE)
add_custom_target(_kinect_data_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "kinect_data" "/home/heramb/HoldMyCup/src/kinect_data/msg/Num.msg" ""
)

#
#  langs = gencpp;genlisp;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(kinect_data
  "/home/heramb/HoldMyCup/src/kinect_data/msg/skeleton.msg"
  "${MSG_I_FLAGS}"
  "/home/heramb/HoldMyCup/src/kinect_data/msg/joint.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/kinect_data
)
_generate_msg_cpp(kinect_data
  "/home/heramb/HoldMyCup/src/kinect_data/msg/joint.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/kinect_data
)
_generate_msg_cpp(kinect_data
  "/home/heramb/HoldMyCup/src/kinect_data/msg/Num.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/kinect_data
)

### Generating Services

### Generating Module File
_generate_module_cpp(kinect_data
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/kinect_data
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(kinect_data_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(kinect_data_generate_messages kinect_data_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/heramb/HoldMyCup/src/kinect_data/msg/skeleton.msg" NAME_WE)
add_dependencies(kinect_data_generate_messages_cpp _kinect_data_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/heramb/HoldMyCup/src/kinect_data/msg/joint.msg" NAME_WE)
add_dependencies(kinect_data_generate_messages_cpp _kinect_data_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/heramb/HoldMyCup/src/kinect_data/msg/Num.msg" NAME_WE)
add_dependencies(kinect_data_generate_messages_cpp _kinect_data_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(kinect_data_gencpp)
add_dependencies(kinect_data_gencpp kinect_data_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS kinect_data_generate_messages_cpp)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(kinect_data
  "/home/heramb/HoldMyCup/src/kinect_data/msg/skeleton.msg"
  "${MSG_I_FLAGS}"
  "/home/heramb/HoldMyCup/src/kinect_data/msg/joint.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/kinect_data
)
_generate_msg_lisp(kinect_data
  "/home/heramb/HoldMyCup/src/kinect_data/msg/joint.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/kinect_data
)
_generate_msg_lisp(kinect_data
  "/home/heramb/HoldMyCup/src/kinect_data/msg/Num.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/kinect_data
)

### Generating Services

### Generating Module File
_generate_module_lisp(kinect_data
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/kinect_data
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(kinect_data_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(kinect_data_generate_messages kinect_data_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/heramb/HoldMyCup/src/kinect_data/msg/skeleton.msg" NAME_WE)
add_dependencies(kinect_data_generate_messages_lisp _kinect_data_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/heramb/HoldMyCup/src/kinect_data/msg/joint.msg" NAME_WE)
add_dependencies(kinect_data_generate_messages_lisp _kinect_data_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/heramb/HoldMyCup/src/kinect_data/msg/Num.msg" NAME_WE)
add_dependencies(kinect_data_generate_messages_lisp _kinect_data_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(kinect_data_genlisp)
add_dependencies(kinect_data_genlisp kinect_data_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS kinect_data_generate_messages_lisp)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(kinect_data
  "/home/heramb/HoldMyCup/src/kinect_data/msg/skeleton.msg"
  "${MSG_I_FLAGS}"
  "/home/heramb/HoldMyCup/src/kinect_data/msg/joint.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/kinect_data
)
_generate_msg_py(kinect_data
  "/home/heramb/HoldMyCup/src/kinect_data/msg/joint.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/kinect_data
)
_generate_msg_py(kinect_data
  "/home/heramb/HoldMyCup/src/kinect_data/msg/Num.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/kinect_data
)

### Generating Services

### Generating Module File
_generate_module_py(kinect_data
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/kinect_data
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(kinect_data_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(kinect_data_generate_messages kinect_data_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/heramb/HoldMyCup/src/kinect_data/msg/skeleton.msg" NAME_WE)
add_dependencies(kinect_data_generate_messages_py _kinect_data_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/heramb/HoldMyCup/src/kinect_data/msg/joint.msg" NAME_WE)
add_dependencies(kinect_data_generate_messages_py _kinect_data_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/heramb/HoldMyCup/src/kinect_data/msg/Num.msg" NAME_WE)
add_dependencies(kinect_data_generate_messages_py _kinect_data_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(kinect_data_genpy)
add_dependencies(kinect_data_genpy kinect_data_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS kinect_data_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/kinect_data)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/kinect_data
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(kinect_data_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()
if(TARGET kinect_data_generate_messages_cpp)
  add_dependencies(kinect_data_generate_messages_cpp kinect_data_generate_messages_cpp)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/kinect_data)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/kinect_data
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(kinect_data_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()
if(TARGET kinect_data_generate_messages_lisp)
  add_dependencies(kinect_data_generate_messages_lisp kinect_data_generate_messages_lisp)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/kinect_data)
  install(CODE "execute_process(COMMAND \"/usr/bin/python\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/kinect_data\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/kinect_data
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(kinect_data_generate_messages_py std_msgs_generate_messages_py)
endif()
if(TARGET kinect_data_generate_messages_py)
  add_dependencies(kinect_data_generate_messages_py kinect_data_generate_messages_py)
endif()
