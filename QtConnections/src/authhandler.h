#ifndef AUTHHANDLER_H
#define AUTHHANDLER_H

#include <QObject>
#include <QtQml/qqmlregistration.h>

class AuthHandler : public QObject
{
    Q_OBJECT
    QML_ELEMENT
    QML_SINGLETON
public:
    explicit AuthHandler(QObject *parent = nullptr);

    void TestCommand();

signals:

};

#endif // AUTHHANDLER_H
