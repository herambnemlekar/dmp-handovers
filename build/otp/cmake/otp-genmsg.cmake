# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "otp: 1 messages, 0 services")

set(MSG_I_FLAGS "-Iotp:/home/heramb/HoldMyCup/src/otp/msg;-Istd_msgs:/opt/ros/indigo/share/std_msgs/cmake/../msg;-Iotp:/home/heramb/HoldMyCup/src/otp/msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(genlisp REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(otp_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/heramb/HoldMyCup/src/otp/msg/pos.msg" NAME_WE)
add_custom_target(_otp_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "otp" "/home/heramb/HoldMyCup/src/otp/msg/pos.msg" ""
)

#
#  langs = gencpp;genlisp;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(otp
  "/home/heramb/HoldMyCup/src/otp/msg/pos.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/otp
)

### Generating Services

### Generating Module File
_generate_module_cpp(otp
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/otp
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(otp_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(otp_generate_messages otp_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/heramb/HoldMyCup/src/otp/msg/pos.msg" NAME_WE)
add_dependencies(otp_generate_messages_cpp _otp_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(otp_gencpp)
add_dependencies(otp_gencpp otp_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS otp_generate_messages_cpp)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(otp
  "/home/heramb/HoldMyCup/src/otp/msg/pos.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/otp
)

### Generating Services

### Generating Module File
_generate_module_lisp(otp
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/otp
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(otp_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(otp_generate_messages otp_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/heramb/HoldMyCup/src/otp/msg/pos.msg" NAME_WE)
add_dependencies(otp_generate_messages_lisp _otp_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(otp_genlisp)
add_dependencies(otp_genlisp otp_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS otp_generate_messages_lisp)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(otp
  "/home/heramb/HoldMyCup/src/otp/msg/pos.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/otp
)

### Generating Services

### Generating Module File
_generate_module_py(otp
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/otp
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(otp_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(otp_generate_messages otp_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/heramb/HoldMyCup/src/otp/msg/pos.msg" NAME_WE)
add_dependencies(otp_generate_messages_py _otp_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(otp_genpy)
add_dependencies(otp_genpy otp_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS otp_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/otp)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/otp
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(otp_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()
if(TARGET otp_generate_messages_cpp)
  add_dependencies(otp_generate_messages_cpp otp_generate_messages_cpp)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/otp)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/otp
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(otp_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()
if(TARGET otp_generate_messages_lisp)
  add_dependencies(otp_generate_messages_lisp otp_generate_messages_lisp)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/otp)
  install(CODE "execute_process(COMMAND \"/usr/bin/python\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/otp\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/otp
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(otp_generate_messages_py std_msgs_generate_messages_py)
endif()
if(TARGET otp_generate_messages_py)
  add_dependencies(otp_generate_messages_py otp_generate_messages_py)
endif()
