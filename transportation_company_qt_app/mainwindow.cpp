
#include "mainwindow.h"
#include "ui_mainwindow.h"


MainWindow::MainWindow(QWidget *parent)
    : QMainWindow(parent)
    , ui(new Ui::MainWindow)
{
    ui->setupUi(this);
    ui->stackedWidget->setCurrentIndex(1); // login page
    // database connection
    db = QSqlDatabase::addDatabase("QMYSQL");
    db.setDatabaseName("transportation_company_db");
    db.setHostName("localhost");
}

MainWindow::~MainWindow()
{
    delete ui;
}



void MainWindow::on_pushButton_7_clicked()
{

}

