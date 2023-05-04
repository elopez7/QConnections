#include "authhandler.h"
#include <QFile>
#include <QDebug>
#include <QUrlQuery>
#include <QNetworkReply>
#include <QCoreApplication>
#include <QNetworkAccessManager>

#include <QJsonObject>
#include <QJsonDocument>

AuthHandler::AuthHandler(QObject *parent)
    : QObject{parent}
    , m_netManager{new QNetworkAccessManager{this}}
    , m_netReply{nullptr}
{

}

void AuthHandler::anonymousLogin()
{
    buildAuthenticationRequest();
}

void AuthHandler::buildAuthenticationRequest()
{
    QFile configFile{":/config.json"};
    if(!configFile.open(QIODevice::ReadOnly | QIODevice::Text))
    {
        qDebug() << "Failed to open file";
        return;
    }

    QJsonDocument jsonDoc{QJsonDocument::fromJson(configFile.readAll())};
    QJsonObject jsonObject{jsonDoc.object()};

    authenticationURL.setScheme("https");
    authenticationURL.setHost("identitytoolkit.googleapis.com");
    authenticationURL.setPath("/v1/accounts:signUp");
    QUrlQuery authenticationQueries;
    authenticationQueries.addQueryItem("key", jsonObject["api_key"].toString());
    authenticationURL.setQuery(authenticationQueries);


    QNetworkRequest request{authenticationURL};
    QByteArray postData;
    postData.append("{returnSecureToken:true}");
    m_netReply = m_netManager->post(request, postData);

    qDebug() << QCoreApplication::applicationDirPath();
}
