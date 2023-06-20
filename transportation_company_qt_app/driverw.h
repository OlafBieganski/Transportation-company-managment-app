#ifndef DRIVERW_H
#define DRIVERW_H

#include <QWidget>
#include "userwidgets.h"

namespace Ui {
class DriverW;
}

class DriverW : public QWidget, public UserWidgets
{
    Q_OBJECT

public:
    explicit DriverW(QWidget *parent = nullptr);
    ~DriverW();
    void pb_setting_clicked();
    void pb_shipments_clicked();
    void pb_vehicles_clicked();

private:
    Ui::DriverW *ui;
};

#endif // DRIVERW_H
