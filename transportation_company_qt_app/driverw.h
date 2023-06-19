#ifndef DRIVERW_H
#define DRIVERW_H

#include <QWidget>
#include "userwidgets.h"

namespace Ui {
class DriverW;
}

class DriverW : public UserWidgets
{
    Q_OBJECT

public:
    explicit DriverW(QWidget *parent = nullptr);
    ~DriverW();

private:
    Ui::DriverW *ui;
};

#endif // DRIVERW_H
