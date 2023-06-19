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
