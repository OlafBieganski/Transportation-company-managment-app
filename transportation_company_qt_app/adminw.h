#ifndef ADMINW_H
#define ADMINW_H

#include <QWidget>
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

private:
    Ui::AdminW *ui;
};

#endif // ADMINW_H
