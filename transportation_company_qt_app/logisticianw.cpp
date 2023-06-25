#include "logisticianw.h"
#include "ui_logisticianw.h"

LogisticianW::LogisticianW(QWidget *parent) :
    QWidget(parent),
    ui(new Ui::LogisticianW)
{
    ui->setupUi(this);
    ui->stackedWidget->setCurrentIndex(0);
}

LogisticianW::~LogisticianW()
{
    delete ui;
}

void LogisticianW::pb_reports_clicked(){

}

void LogisticianW::pb_setting_clicked(){

}

void LogisticianW::pb_shipments_clicked(){
    ui->stackedWidget->setCurrentIndex(1);
}

void LogisticianW::on_readShipmentBtn_clicked()
{
    queryModel = new QSqlQueryModel;
    queryModel->setQuery("select * from customer_shipment");
    ui->shipmentTable->setModel(queryModel);
}

void LogisticianW::pb_vehicles_clicked(){
    ui->stackedWidget->setCurrentIndex(2);
}

void LogisticianW::on_readTrucksBtn_clicked()
{
    queryModel = new QSqlQueryModel;
    queryModel->setQuery("select * from trucks");
    ui->trucksTable->setModel(queryModel);
}

