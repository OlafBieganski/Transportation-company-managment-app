#include "driverw.h"
#include "ui_driverw.h"

DriverW::DriverW(QWidget *parent) :
    QWidget(parent),
    ui(new Ui::DriverW)
{
    ui->setupUi(this);
}

DriverW::~DriverW()
{
    delete ui;
}

void DriverW::pb_shipments_clicked(){
    ui->stackedWidget->setCurrentIndex(0);
}

void DriverW::pb_vehicles_clicked(){
    ui->stackedWidget->setCurrentIndex(1);
}
