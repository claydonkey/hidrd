 cmake_minimum_required(VERSION 3.5)

add_custom_target(ALL COMMAND make run
                   . ${CMAKE_CURRENT_SOURCE_DIR}
)