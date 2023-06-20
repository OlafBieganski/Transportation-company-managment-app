#include "customerw.h"
#include "ui_customerw.h"

CustomerW::CustomerW(QWidget *parent) :
    QWidget(parent),
    ui(new Ui::CustomerW)
{
    ui->setupUi(this);
}

CustomerW::~CustomerW()
{
    delete ui;
}

void CustomerW::pb_shipments_clicked(){

}

void CustomerW::pb_reports_clicked(){

}

void CustomerW::pb_setting_clicked(){

}
