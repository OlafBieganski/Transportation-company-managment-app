
#include "mainwindow.h"
#include "ui_mainwindow.h"

MainWindow::MainWindow(QWidget *parent)
    : QMainWindow(parent)
    , ui(new Ui::MainWindow)
{
    ui->setupUi(this);
    ui->stackedWidget->setCurrentIndex(1); // login page
    user_widget = ui->basic_widget;
}

MainWindow::~MainWindow()
{
    delete ui;
}


void MainWindow::on_pb_login_clicked()
{
    // uzytkownicy musza miec stowrzone konta z poziomu bazy
    // tutaj uzywamy tych danych do logowania
    // nazwy i hasla musz byc zgodne z tymi z tabeli access
    username = ui->LE_login->text();
    passwd = ui->LE_login->text();

    QSqlDatabase db = QSqlDatabase::addDatabase("QMYSQL");
    db.setHostName("localhost");
    db.setDatabaseName("transportation_company_DB"); // nie wiem czy końcówka nie z małych _db
    db.setUserName(username);
    db.setPassword(passwd);

    if (db.open()) {
        QSqlQuery query;
        QString queryString = "SELECT acount_type FROM access WHERE username = :username AND password = :password";
        query.prepare(queryString);
        query.bindValue(":username", username);
        query.bindValue(":password", passwd);
        char accountType = 'e';
        if (query.exec()) {
            if (query.next()) {
                accountType = query.value(0).toChar().toLatin1();
            } else {
                qDebug() << "No accountType found";
                return;
            }
        } else {
            qDebug() << "Error executing the query: " << query.lastError().text();
            return;
        }
        switch (accountType) {
        case 'D':
            user_widget = qobject_cast<DriverW*>(user_widget);
            if (!user_widget)
            {
                qDebug() << "Casting error DriverW";
            }
            break;
        case 'L':
            user_widget = qobject_cast<LogisticianW*>(user_widget);
            if (!user_widget)
            {
                qDebug() << "Casting error LogisticianW";
            }
            break;
        case 'A':
            user_widget = qobject_cast<AdminW*>(user_widget);
            if (!user_widget)
            {
                qDebug() << "Casting error AdminW";
            }
            break;
        case 'C':
            user_widget = qobject_cast<CustomerW*>(user_widget);
            if (!user_widget)
            {
                qDebug() << "Casting error CustomerW";
            }
            break;
        default:
            qDebug() << "Error while determining user type. ";
            break;
        }

        ui->stackedWidget->setCurrentIndex(0); // zmieniamy na strone glowna
    } else {
        qDebug() << "Error connecting to the database: " << db.lastError().text();
    }

}


void MainWindow::on_pb_register_clicked()
{
    // kod do rejestrowania klienta w bazie
    // chyba jest procedura skladowana do tego add_user czy cos
}

