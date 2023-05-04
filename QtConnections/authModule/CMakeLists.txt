cmake_minimum_required(VERSION 3.21.1)

find_package(Qt6 6.5 REQUIRED COMPONENTS Gui Network)

set(QT_QML_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/qml)

set(QML_IMPORT_PATH ${QT_QML_OUTPUT_DIRECTORY}
    CACHE STRING "Qt Creator auth component import path"
    FORCE
)

qt_add_library(authModule STATIC)
qt6_add_qml_module(authModule
    URI "authModule"
    AUTO_RESOURCE_PREFIX
    VERSION 1.0
    PLUGIN_TARGET authModulePlugin
    IMPORT_PATH ${QT_QML_OUTPUT_DIRECTORY}
    SOURCES
        authhandler.h
        authhandler.cpp
)

target_include_directories(authModule
    PUBLIC "${CMAKE_CURRENT_SOURCE_DIR}/../"
    PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}"
)

target_link_libraries(authModule
    PRIVATE Qt6::Gui
    PRIVATE Qt6::Network
)
