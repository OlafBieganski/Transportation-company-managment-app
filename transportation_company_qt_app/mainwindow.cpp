#include "mainwindow.h"
#include "ui_mainwindow.h"

MainWindow::MainWindow(QWidget *parent)
    : QMainWindow(parent)
    , ui(new Ui::MainWindow)
{
    ui->setupUi(this);
    ui->stackedWidget->setCurrentIndex(1); // login page
}

MainWindow::~MainWindow()
{
    delete ui;
}


void MainWindow::on_pb_login_clicked()
{
    // uzytkownicy musza miec stowrzone konta z poziomu bazy
    // tutaj uzywamy tych danych do logowania
    // nazwy i hasla musza byc zgodne z tymi z tabeli access
    username = ui->LE_login->text();
    passwd = ui->LE_passwd->text();

    db = QSqlDatabase::addDatabase("QMYSQL");
    db.setHostName("localhost");
    db.setDatabaseName("transportation_company_DB");
    db.setUserName(username);
    db.setPassword(passwd);

    if (db.open()) {
        QSqlQuery query;
        QString queryString = "SELECT acount_type FROM access WHERE username = :username AND password = :password";
        query.prepare(queryString);
        query.bindValue(":username", username);
        query.bindValue(":password", passwd);
        QString accountType;
        if (query.exec()) {
            if (query.next()) {
                accountType = query.value(0).toString();
            } else {
                qDebug() << "No accountType found";
                return;
            }
        } else {
            qDebug() << "Error executing the query: " << query.lastError().text();
            return;
        }

        if (accountType == "C")
        {
            CustomerW* temp = new CustomerW();
            userWidget = temp;
            user_btn_handler = temp;
            ui->pb_empolyees->hide();
            ui->pb_vehicles->hide();
            ui->pb_reports->hide();
        }
        else if (accountType == "D")
        {
            DriverW* temp = new DriverW();
            userWidget = temp;
            user_btn_handler = temp;
            ui->pb_empolyees->hide();
            ui->pb_reports->hide();
        }
        else if (accountType == "A")
        {
            AdminW* temp = new AdminW();
            userWidget = temp;
            user_btn_handler = temp;
        }
        else if (accountType == "L")
        {
            LogisticianW* temp = new LogisticianW();
            userWidget = temp;
            user_btn_handler = temp;
            ui->pb_empolyees->hide();
        }
        else
        {
            qDebug() << "Error while determining user type. ";
            return;
        }
        ui->stackedWidget_users->addWidget(userWidget);
        ui->stackedWidget_users->setCurrentWidget(userWidget);
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


void MainWindow::on_pb_reports_clicked()
{
    user_btn_handler->pb_reports_clicked();
}


void MainWindow::on_pb_empolyees_clicked()
{
    user_btn_handler->pb_employees_clicked();
}


void MainWindow::on_pb_shipments_clicked()
{
    user_btn_handler->pb_shipments_clicked();
}


void MainWindow::on_pb_vehicles_clicked()
{
    user_btn_handler->pb_vehicles_clicked();
}


void MainWindow::on_pb_settings_clicked()
{
    ui->stackedWidget->setCurrentIndex(2);
}


void MainWindow::on_close_btn_clicked()
{
    db.close();
    close();
}


void MainWindow::on_logout_btn_clicked()
{
    db.close();
    ui->stackedWidget->setCurrentIndex(1);
    ui->LE_login->clear();
    ui->LE_passwd->clear();
}


void MainWindow::on_cancel_btn_clicked()
{
    ui->stackedWidget->setCurrentIndex(0);
}

