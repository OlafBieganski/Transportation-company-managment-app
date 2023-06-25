#ifndef LOGISTICIANW_H
#define LOGISTICIANW_H

#include <QWidget>
#include <QtSql>
#include <userwidgets.h>

namespace Ui {
class LogisticianW;
}

class LogisticianW : public QWidget,  public UserWidgets
{
    Q_OBJECT

public:
    explicit LogisticianW(QWidget *parent = nullptr);
    ~LogisticianW();
    void pb_setting_clicked();
    void pb_reports_clicked();
    void pb_shipments_clicked();
    void pb_vehicles_clicked();

private slots:
    void on_readShipmentBtn_clicked();
    void on_readTrucksBtn_clicked();

private:
    Ui::LogisticianW *ui;
    QSqlQueryModel *queryModel;
};

#endif // LOGISTICIANW_H
