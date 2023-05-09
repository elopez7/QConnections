#ifndef DASHBOARDCOMPONENT_H
#define DASHBOARDCOMPONENT_H

#include <QUrl>
#include <QObject>
#include <QProperty>
#include <QJsonObject>
#include <QtQml/qqmlregistration.h>

class QNetworkAccessManager;
class QNetworkReply;

class DashboardComponent : public QObject
{
    Q_OBJECT
    QML_NAMED_ELEMENT(DashboardComponent)
public:
    explicit DashboardComponent(QObject *parent = nullptr);

    Q_PROPERTY(QString firstName READ getFirstName WRITE setFirstName NOTIFY firstNameChanged)
    Q_PROPERTY(QString lastName READ getLastName WRITE setLastName NOTIFY lastNameChanged)
    Q_PROPERTY(QString email READ getEmail WRITE setEmail NOTIFY emailChanged)
    Q_PROPERTY(QString profilePicture READ getProfilePicture WRITE setProfilePicture NOTIFY profilePictureChanged)
    Q_INVOKABLE void getRandomUserFromWeb();

    QString getFirstName() const;
    void setFirstName(const QString &newFirstName);

    QString getLastName() const;
    void setLastName(const QString &newLastName);

    QString getEmail() const;
    void setEmail(const QString &newEmail);

    QString getProfilePicture() const;
    void setProfilePicture(const QString &newProfilePicture);

public slots:
    void getRandomUserReplyReadyRead();
    void getRandomUserReplyFinishRead();

signals:

    void firstNameChanged();
    void lastNameChanged();
    void emailChanged();

    void randomUserReadSuccess();
    void randomUserReadFailure();

    void profilePictureChanged();

private:
    QNetworkAccessManager* m_netManager;
    QNetworkReply* m_netReply;
    QByteArray* m_dataBuffer;

    QString m_firstName;
    QString m_lastName;
    QString m_email;
    QString m_profilePicture;
};

#endif // DASHBOARDCOMPONENT_H
