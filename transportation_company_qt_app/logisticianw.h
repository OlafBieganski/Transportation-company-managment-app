#ifndef LOGISTICIANW_H
#define LOGISTICIANW_H

#include <QWidget>
#include <userwidgets.h>

namespace Ui {
class LogisticianW;
}

class LogisticianW : public UserWidgets
{
    Q_OBJECT

public:
    explicit LogisticianW(QWidget *parent = nullptr);
    ~LogisticianW();

private:
    Ui::LogisticianW *ui;
};

#endif // LOGISTICIANW_H
