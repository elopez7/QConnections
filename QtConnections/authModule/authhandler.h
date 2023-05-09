#ifndef AUTHHANDLER_H
#define AUTHHANDLER_H

#include <QUrl>
#include <QObject>
#include <QProperty>
#include <QJsonObject>
#include <QtQml/qqmlregistration.h>


class QNetworkAccessManager;
class QNetworkReply;

class AuthHandler : public QObject
{
    Q_OBJECT
    QML_SINGLETON
    QML_NAMED_ELEMENT(AuthComponent)

public:
    explicit AuthHandler(QObject *parent = nullptr);

    enum class AuthenticationMethod{
        Anonoymous,
        EmailAndPassword
    };
    Q_ENUM(AuthenticationMethod)

    Q_PROPERTY(AuthenticationMethod authMethod READ getAuthMethod WRITE setAuthMethod NOTIFY authMethodChanged)
    Q_INVOKABLE void anonymousLogin();
    Q_INVOKABLE void emailPasswordSignUp(QString email, QString password);
    Q_INVOKABLE void emailPasswordSignIn(QString email, QString password);

    AuthenticationMethod getAuthMethod() const;
    void setAuthMethod(AuthenticationMethod newAuthMethod);

public slots:
    void anonymousLoginReplyReadyRead();
    void anonymousLoginFinishRead();
    void emailPasswordSignUpReadyRead();
    void emailPasswordSignUpFinished();
    void emailPasswordLogInReadyRead();
    void emailPasswordLogInFinished();

signals:
    void anonymousLoginSuccess();
    void anonymousLoginFailure();
    void emailPasswordSignUpSuccess();
    void emailPasswordSignUpFailure();
    void emailPasswordLogInSuccess();
    void emailPasswordLogInFailure();

    void authMethodChanged();

private:
    QNetworkAccessManager* m_netManager;
    QNetworkReply* m_netReply;
    QByteArray* m_dataBuffer;

    QJsonObject configSettings;
    QUrl authenticationURL;
    QUrlQuery buildAuthenticationQuery();

    void getUserConfig();
    void buildAuthenticationRequest(AuthenticationMethod authenticationMethod);
    void sendAnonymousAuthenticationRequest();
    void sendEmailPasswordSignUpAuthRequest(QString& email, QString& password);
    void sendEmailPasswordLogInAuthRequest(QString& email, QString& password);
    AuthenticationMethod m_authMethod;
};

#endif // AUTHHANDLER_H
