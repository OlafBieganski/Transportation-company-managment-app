
#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QMainWindow>
#include <QtSql>
#include <userwidgets.h>
#include <driverw.h>
#include <logisticianw.h>
#include <adminw.h>
#include <customerw.h>

QT_BEGIN_NAMESPACE
namespace Ui { class MainWindow; }
QT_END_NAMESPACE

class MainWindow : public QMainWindow

{
    Q_OBJECT

public:
    MainWindow(QWidget *parent = nullptr);
    ~MainWindow();

private slots:

    void on_pb_login_clicked();

    void on_pb_register_clicked();

private:
    Ui::MainWindow *ui;
    QSqlDatabase db;
    UserType logged_user = NO_USER;
    UserWidgets* user_widget = nullptr;
    QString username = "";
    QString passwd = "";
};

#endif // MAINWINDOW_H
