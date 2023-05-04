#ifndef AUTHHANDLER_H
#define AUTHHANDLER_H

#include <QObject>
#include <QtQml/qqmlregistration.h>
#include <QUrl>


class QNetworkAccessManager;
class QNetworkReply;

class AuthHandler : public QObject
{
    Q_OBJECT
    QML_NAMED_ELEMENT(LoginComponent)
public:
    explicit AuthHandler(QObject *parent = nullptr);

    Q_INVOKABLE void anonymousLogin();

signals:

private:
    QNetworkAccessManager* m_netManager;
    QNetworkReply* m_netReply;

    QUrl authenticationURL;
    void buildAuthenticationRequest();
    QUrlQuery buildAuthenticationQuery();

};

#endif // AUTHHANDLER_H
