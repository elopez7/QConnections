#include "authhandler.h"
#include <QFile>
#include <QDebug>
#include <QUrlQuery>
#include <QJsonDocument>
#include <QNetworkReply>
#include <QCoreApplication>
#include <QNetworkAccessManager>



AuthHandler::AuthHandler(QObject *parent)
    : QObject{parent}
    , m_netManager{new QNetworkAccessManager{this}}
    , m_netReply{nullptr}
    , m_dataBuffer{new QByteArray{}}
{
    getUserConfig();
}

void AuthHandler::getUserConfig()
{
    QFile configFile{":/config.json"};
    if(!configFile.open(QIODevice::ReadOnly | QIODevice::Text))
    {
        qDebug() << "Failed to open file";
        return;
    }

    QJsonDocument jsonDoc{QJsonDocument::fromJson(configFile.readAll())};
    configSettings = jsonDoc.object();
}

void AuthHandler::anonymousLogin()
{
    setAuthMethod(AuthenticationMethod::Anonoymous);
    buildAuthenticationRequest(getAuthMethod());
    sendAnonymousAuthenticationRequest();
}

void AuthHandler::sendAnonymousAuthenticationRequest()
{
    QNetworkRequest request{authenticationURL};
    QByteArray postData;
    postData.append("{returnSecureToken:true}");
    m_netReply = m_netManager->post(request, postData);

    connect(m_netReply, &QNetworkReply::readyRead, this, &AuthHandler::anonymousLoginReplyReadyRead);
    connect(m_netReply, &QNetworkReply::finished, this, &AuthHandler::anonymousLoginFinishRead);
}

void AuthHandler::emailPasswordSignUp(QString email, QString password)
{
    //Using anonymous because for SIGN UP the path is the same'
    //Path differs when SIGN IN is implemented
    setAuthMethod(AuthenticationMethod::Anonoymous);
    buildAuthenticationRequest(getAuthMethod());
    sendEmailPasswordSignUpAuthRequest(email, password);
}

void AuthHandler::emailPasswordSignIn(QString email, QString password)
{
    setAuthMethod(AuthenticationMethod::EmailAndPassword);
    buildAuthenticationRequest(getAuthMethod());
    sendEmailPasswordLogInAuthRequest(email, password);
}

void AuthHandler::sendEmailPasswordSignUpAuthRequest(QString& email, QString& password)
{
    QNetworkRequest request{authenticationURL};
    request.setHeader(QNetworkRequest::ContentTypeHeader, QString("application/json"));
    QByteArray postData;

    QVariantMap payload;
    payload["email"] = email;
    payload["password"] = password;
    payload["returnSecureToken"] = true;

    QJsonDocument jsonPayload = QJsonDocument::fromVariant(payload);

    postData.append(QString("{email:%1, password:%2, returnSecureToken:true}").arg(email, password).toUtf8());

    m_netReply = m_netManager->post(request, jsonPayload.toJson());

    connect(m_netReply, &QNetworkReply::readyRead, this, &AuthHandler::emailPasswordSignUpReadyRead);
    connect(m_netReply, &QNetworkReply::finished, this, &AuthHandler::emailPasswordSignUpFinished);
}

void AuthHandler::sendEmailPasswordLogInAuthRequest(QString &email, QString &password)
{
    QNetworkRequest request{authenticationURL};
    request.setHeader(QNetworkRequest::ContentTypeHeader, QString("application/json"));
    QByteArray postData;

    QVariantMap payload;
    payload["email"] = email;
    payload["password"] = password;
    payload["returnSecureToken"] = true;

    QJsonDocument jsonPayload = QJsonDocument::fromVariant(payload);

    postData.append(QString("{email:%1, password:%2, returnSecureToken:true}").arg(email, password).toUtf8());

    m_netReply = m_netManager->post(request, jsonPayload.toJson());

    connect(m_netReply, &QNetworkReply::readyRead, this, &AuthHandler::emailPasswordLogInReadyRead);
    connect(m_netReply, &QNetworkReply::finished, this, &AuthHandler::emailPasswordLogInFinished);
}

void AuthHandler::buildAuthenticationRequest(AuthenticationMethod authenticationMethod)
{
    authenticationURL.setScheme(configSettings["scheme"].toString());
    authenticationURL.setHost(configSettings["host"].toString());

    switch(authenticationMethod)
    {
    case AuthenticationMethod::Anonoymous:
        authenticationURL.setPath(configSettings["signUp_path"].toString());
        break;
    case AuthenticationMethod::EmailAndPassword:
        authenticationURL.setPath(configSettings["signIn_path"].toString());
        break;
    }

    QUrlQuery authenticationQueries;
    authenticationQueries.addQueryItem("key", configSettings["api_key"].toString());
    authenticationURL.setQuery(authenticationQueries);
}

void AuthHandler::anonymousLoginReplyReadyRead()
{
    m_dataBuffer->append(m_netReply->readAll());
}

void AuthHandler::anonymousLoginFinishRead()
{
    if(m_netReply->error())
    {
        qDebug() << "Error: " << m_netReply->errorString();
        emit anonymousLoginFailure();
        return;
    }
    emit anonymousLoginSuccess();
    /* Convert Anonymous Response to JsonDocument
    QJsonDocument doc{QJsonDocument::fromJson(*m_dataBuffer)};
    m_dataBuffer->clear();

    QJsonObject userObject{doc.object()};
    QString userLocalId{userObject.value(QStringLiteral("localId")).toString()};
*/

    /* Save a contact to the database
    QVariantMap newUser;
    newUser["Name"] = userLocalId;

    //QVector<QVariantMap> contactList;
    QVariantMap newContact;
    newContact["FirstName"] = "Fernando";
    newContact["LastName"] = "Alonso";
    newContact["Phone Number"] = "222-222-5689";
    newContact["Email"] = "Fernando@AstonMartin.com";
    //contactList.push_back(newContact);
    newUser["Contacts"] = newContact;


    QJsonDocument newUserDoc {QJsonDocument::fromVariant(newUser)};

    QNetworkRequest newUserRequest(QUrl("https://qconnections-66a1a-default-rtdb.firebaseio.com/Users.json"));
    newUserRequest.setHeader(QNetworkRequest::ContentTypeHeader, QString("application/json"));
    m_netManager->post(newUserRequest, newUserDoc.toJson());
*/
}

void AuthHandler::emailPasswordSignUpReadyRead()
{
    m_dataBuffer->append(m_netReply->readAll());
}

void AuthHandler::emailPasswordSignUpFinished()
{
    if(m_netReply->error())
    {
        qDebug() << "Error: " << m_netReply->errorString();
        emit emailPasswordSignUpFailure();
        return;
    }
    emit emailPasswordSignUpSuccess();
}

void AuthHandler::emailPasswordLogInReadyRead()
{
    m_dataBuffer->append(m_netReply->readAll());
}

void AuthHandler::emailPasswordLogInFinished()
{
    if(m_netReply->error())
    {
        qDebug() << "Error: " << m_netReply->errorString();
        emit emailPasswordLogInFailure();
        return;
    }
    emit emailPasswordLogInSuccess();
}

AuthHandler::AuthenticationMethod AuthHandler::getAuthMethod() const
{
    return m_authMethod;
}

void AuthHandler::setAuthMethod(AuthenticationMethod newAuthMethod)
{
    if (m_authMethod == newAuthMethod)
        return;
    m_authMethod = newAuthMethod;
    emit authMethodChanged();
}
