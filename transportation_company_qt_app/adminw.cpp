#include "adminw.h"
#include "ui_adminw.h"

AdminW::AdminW(QWidget *parent) :
    QWidget(parent),
    ui(new Ui::AdminW)
{
    ui->setupUi(this);
}

AdminW::~AdminW()
{
    delete ui;
}


void AdminW::pb_employees_clicked(){

}

void AdminW::pb_reports_clicked(){

}

void AdminW::pb_setting_clicked(){

}

void AdminW::pb_shipments_clicked(){

}

void AdminW::pb_vehicles_clicked(){

}
