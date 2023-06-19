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
