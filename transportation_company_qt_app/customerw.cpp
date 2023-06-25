#include "customerw.h"
#include "ui_customerw.h"

CustomerW::CustomerW(QWidget *parent) :
    QWidget(parent),
    ui(new Ui::CustomerW)
{
    ui->setupUi(this);
    ui->stackedWidget->setCurrentIndex(0);
}

CustomerW::~CustomerW()
{
    delete ui;
}

void CustomerW::pb_shipments_clicked(){
    ui->stackedWidget->setCurrentIndex(1);
}

void CustomerW::on_readShipmentBtn_clicked()
{
    queryModel = new QSqlQueryModel;
    queryModel->setQuery("select * from customer_shipment where company_name = 'Firmex'");
    ui->shipmentTable->setModel(queryModel);
}
void CustomerW::on_readRoutesBtn_clicked()
{
    queryModel = new QSqlQueryModel;
    queryModel->setQuery("select * from route");
    ui->shipmentTable->setModel(queryModel);
}
void CustomerW::pb_reports_clicked(){

}

void CustomerW::pb_setting_clicked(){

}



