#include "logisticianw.h"
#include "ui_logisticianw.h"

LogisticianW::LogisticianW(QWidget *parent) :
    QWidget(parent),
    ui(new Ui::LogisticianW)
{
    ui->setupUi(this);
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

}

void LogisticianW::pb_vehicles_clicked(){

}
