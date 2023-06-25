#ifndef CUSTOMERW_H
#define CUSTOMERW_H

#include <QWidget>
#include <QtSql>
#include <userwidgets.h>

namespace Ui {
class CustomerW;
}

class CustomerW : public QWidget,  public UserWidgets
{
    Q_OBJECT

public:
    explicit CustomerW(QWidget *parent = nullptr);
    ~CustomerW();
    // tutaj deklaracje tylko tych funcki ktore maja specyficzne dzialanie dla danego uzytkownika
    void pb_reports_clicked();
    void pb_shipments_clicked();
    void pb_setting_clicked();

private slots:
    void on_readShipmentBtn_clicked();

    void on_readRoutesBtn_clicked();

private:
    Ui::CustomerW *ui;
    QSqlQueryModel *queryModel;
};

#endif // CUSTOMERW_H
