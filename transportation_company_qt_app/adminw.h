#ifndef ADMINW_H
#define ADMINW_H

#include <QWidget>
#include <userwidgets.h>

namespace Ui {
class AdminW;
}

class AdminW : public UserWidgets
{
    Q_OBJECT

public:
    explicit AdminW(QWidget *parent = nullptr);
    ~AdminW();

private:
    Ui::AdminW *ui;
};

#endif // ADMINW_H
