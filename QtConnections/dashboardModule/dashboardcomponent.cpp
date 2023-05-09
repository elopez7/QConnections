#include "dashboardcomponent.h"
#include <QFile>
#include <QDebug>
#include <QUrlQuery>
#include <QJsonArray>
#include <QJsonDocument>
#include <QNetworkReply>
#include <QCoreApplication>
#include <QNetworkAccessManager>

DashboardComponent::DashboardComponent(QObject *parent)
    : QObject{parent}
    , m_netManager{new QNetworkAccessManager{this}}
    , m_netReply{nullptr}
    , m_dataBuffer{new QByteArray{}}
{
}

void DashboardComponent::getRandomUserFromWeb()
{
    QNetworkRequest request{QUrl(QStringLiteral("https://randomuser.me/api/?results=1"))};
    m_netReply = m_netManager->get(request);

    connect(m_netReply, &QNetworkReply::readyRead, this, &DashboardComponent::getRandomUserReplyReadyRead);
    connect(m_netReply, &QNetworkReply::finished, this, &DashboardComponent::getRandomUserReplyFinishRead);
}

QString DashboardComponent::getFirstName() const
{
    return m_firstName;
}

void DashboardComponent::setFirstName(const QString &newFirstName)
{
    if (m_firstName == newFirstName)
        return;
    m_firstName = newFirstName;
    emit firstNameChanged();
}

void DashboardComponent::getRandomUserReplyReadyRead()
{
    m_dataBuffer->append(m_netReply->readAll());
}

void DashboardComponent::getRandomUserReplyFinishRead()
{
    if(m_netReply->error())
    {
        qDebug() << "Error: " << m_netReply->errorString();
        emit randomUserReadFailure();
        return;
    }
    QJsonDocument doc{QJsonDocument::fromJson(*m_dataBuffer)};
    m_dataBuffer->clear();
    QJsonArray jsonArray = doc["results"].toArray();
    QJsonObject userObject{jsonArray.first().toObject()};

    setFirstName(userObject.value("name")["first"].toString());
    setLastName(userObject.value("name")["last"].toString());
    setEmail(userObject.value("email").toString());
    setProfilePicture(userObject.value("picture")["large"].toString());

    emit randomUserReadSuccess();
}

QString DashboardComponent::getLastName() const
{
    return m_lastName;
}

void DashboardComponent::setLastName(const QString &newLastName)
{
    if (m_lastName == newLastName)
        return;
    m_lastName = newLastName;
    emit lastNameChanged();
}

QString DashboardComponent::getEmail() const
{
    return m_email;
}

void DashboardComponent::setEmail(const QString &newEmail)
{
    if (m_email == newEmail)
        return;
    m_email = newEmail;
    emit emailChanged();
}

QString DashboardComponent::getProfilePicture() const
{
    return m_profilePicture;
}

void DashboardComponent::setProfilePicture(const QString &newProfilePicture)
{
    if (m_profilePicture == newProfilePicture)
        return;
    m_profilePicture = newProfilePicture;
    emit profilePictureChanged();
}
