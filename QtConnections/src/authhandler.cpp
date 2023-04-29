#include "authhandler.h"
#include <QDebug>

AuthHandler::AuthHandler(QObject *parent)
    : QObject{parent}
{

}

void AuthHandler::TestCommand()
{
    qDebug() << "Hello World!";
}
