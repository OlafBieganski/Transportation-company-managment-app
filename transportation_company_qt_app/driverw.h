#ifndef DRIVERW_H
#define DRIVERW_H

#include <QWidget>
#include <QtSql>
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
    // tutaj deklaracje tylko tych funcki ktore maja specyficzne dzialanie dla danego uzytkownika
    //void pb_setting_clicked();
    void pb_shipments_clicked();
    void pb_vehicles_clicked();

private slots:
    void on_readShipmentBtn_clicked();

    void on_readTruckBtn_clicked();

private:
    Ui::DriverW *ui;
    QSqlQueryModel *queryModel;
};

#endif // DRIVERW_H
