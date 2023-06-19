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
