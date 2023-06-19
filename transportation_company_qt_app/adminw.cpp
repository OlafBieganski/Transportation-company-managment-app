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
