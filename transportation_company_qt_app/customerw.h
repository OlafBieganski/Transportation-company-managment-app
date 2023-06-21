#ifndef CUSTOMERW_H
#define CUSTOMERW_H

#include <QWidget>
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

private:
    Ui::CustomerW *ui;
};

#endif // CUSTOMERW_H
