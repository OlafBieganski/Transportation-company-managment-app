#include "driverw.h"
#include "ui_driverw.h"

DriverW::DriverW(QWidget *parent) :
    QWidget(parent),
    ui(new Ui::DriverW)
{
    ui->setupUi(this);
    ui->stackedWidget->setCurrentIndex(0);
}

DriverW::~DriverW()
{
    delete ui;
}

void DriverW::pb_shipments_clicked(){
    ui->stackedWidget->setCurrentIndex(1);
}

void DriverW::on_readShipmentBtn_clicked()
{
    queryModel = new QSqlQueryModel;
    queryModel->setQuery("select * from job_route where employes_employee_id = '4'");
    ui->shipmentTable->setModel(queryModel);
}

void DriverW::pb_vehicles_clicked(){
    ui->stackedWidget->setCurrentIndex(2);
}

void DriverW::on_readTruckBtn_clicked()
{
    queryModel = new QSqlQueryModel;
    queryModel->setQuery("select * from driver_truck where employes_employee_id = '4'");
    ui->trucksTable->setModel(queryModel);
}

