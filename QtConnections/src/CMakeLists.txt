
#qt_add_library(authModule STATIC)
qt6_add_qml_module(authModule
    URI authModule
    VERSION 1.0
    SOURCES
        authhandler.h
        authhandler.cpp
)
