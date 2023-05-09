cmake_minimum_required(VERSION 3.21.1)

find_package(Qt6 6.5 REQUIRED COMPONENTS Gui Network)

set(QR_QML_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/qml)

set(QML_IMPORT_PATH ${QT_QML_OUTPUT_DIRECTORY}
    CACHE STRING "Qt Creator Dasboard Component"
    FORCE
)

qt_add_library(dashboardModule STATIC)
qt6_add_qml_module(dashboardModule
    URI "dashboardModule"
    AUTO_RESOURCE_PREFIX
    VERSION 1.0
    PLUGIN_TARGET dashboardModulePlugin
    IMPORT_PATH ${QT_QML_OUTPUT_DIRECTORY}
    SOURCES
        dashboardcomponent.h
        dashboardcomponent.cpp
)

target_include_directories(dashboardModule
    PUBLIC "${CMAKE_CURRENT_SOURCE_DIR}/../"
    PRIVATE "{CMAKE_CURRENT_SOURCE_DIR}"
)


target_link_libraries(dashboardModule
    PRIVATE Qt6::Gui
    PRIVATE Qt6::Network
)
