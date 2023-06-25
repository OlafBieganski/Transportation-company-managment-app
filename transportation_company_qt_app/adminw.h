#ifndef ADMINW_H
#define ADMINW_H

#include <QWidget>
#include <QtSql>
#include <userwidgets.h>

namespace Ui {
class AdminW;
}

class AdminW : public QWidget, public UserWidgets
{
    Q_OBJECT

public:
    explicit AdminW(QWidget *parent = nullptr);
    ~AdminW();
    void pb_setting_clicked();
    void pb_reports_clicked();
    void pb_employees_clicked();
    void pb_shipments_clicked();
    void pb_vehicles_clicked();

private slots:
    void on_readEmployeesBtn_clicked();
    void on_addEmployeeBtn_clicked();
    void on_register_employeeBtn_clicked();
    void on_cancelBtn_clicked();
    void on_readShipmentBtn_clicked();
    void on_readTrucksBtn_clicked();
    void on_deleteEmployeeBtn_clicked();
    void on_deleteUserBtn_clicked();
    void on_cancelDeleteUserBtn_clicked();

private:
    Ui::AdminW *ui;
    QSqlQueryModel *queryModel;
};

#endif // ADMINW_H
