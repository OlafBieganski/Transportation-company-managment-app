#ifndef USERWIDGETS_H
#define USERWIDGETS_H

#include <QWidget>

enum UserType {NO_USER, ADMIN, LOGISTICIAN, CUSTOMER, DRIVER};

class UserWidgets : public QWidget{

    Q_OBJECT

public:
    UserWidgets(QWidget *parent = nullptr);
    ~UserWidgets();
    virtual void pb_setting_clicked() = 0;
    virtual void pb_reports_clicked();
    virtual void pb_employees_clicked();
    virtual void pb_shipments_clicked();
    virtual void pb_vehicles_clicked();
};

#endif // USERWIDGETS_H
