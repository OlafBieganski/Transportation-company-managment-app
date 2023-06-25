#include "adminw.h"
#include "ui_adminw.h"

AdminW::AdminW(QWidget *parent) :
    QWidget(parent),
    ui(new Ui::AdminW)
{
    ui->setupUi(this);
    ui->stackedWidget->setCurrentIndex(0);
}

AdminW::~AdminW()
{
    delete ui;
}

void AdminW::pb_reports_clicked(){

}

void AdminW::pb_setting_clicked(){

}

void AdminW::pb_shipments_clicked(){
    ui->stackedWidget->setCurrentIndex(3);
}

void AdminW::on_readShipmentBtn_clicked()
{
    queryModel = new QSqlQueryModel;
    queryModel->setQuery("select * from shipment");
    ui->shipmentTable->setModel(queryModel);
}

void AdminW::pb_vehicles_clicked(){
    ui->stackedWidget->setCurrentIndex(2);
}

void AdminW::on_readTrucksBtn_clicked()
{
    queryModel = new QSqlQueryModel;
    queryModel->setQuery("select * from trucks");
    ui->trucksTable->setModel(queryModel);
}

void AdminW::pb_employees_clicked(){
    ui->stackedWidget->setCurrentIndex(1);
}

void AdminW::on_readEmployeesBtn_clicked()
{
    queryModel = new QSqlQueryModel;
    queryModel->setQuery("select employee_id, first_name, last_name, age, phone_nr, email from employes");
    ui->emplTable->setModel(queryModel);
}

void AdminW::on_addEmployeeBtn_clicked()
{
    ui->stackedWidget->setCurrentIndex(4);
}


void AdminW::on_register_employeeBtn_clicked()
{
    QSqlQuery query;
    QString username, password, email, first_name, last_name, sex, phone_nr, access_type;
    int age, salary;
    username = ui->le_Login->text();
    password = ui->le_Psswd->text();
    email = ui->le_Email->text();
    first_name = ui->le_Name->text();
    last_name = ui->le_Surname->text();
    sex = ui->le_Sex->text();
    phone_nr = ui->le_Phone->text();
    access_type = ui->le_Account->text();
    age = ui->le_Age->text().toInt();
    salary = ui->le_Salary->text().toInt();
    QString queryString = "CALL register_employee(:username, :password, :email, :first_name, :last_name, :sex, :age, :salary, :phone_nr, :access_type)";
    query.prepare(queryString);
    query.bindValue(":username", username);
    query.bindValue(":password", password);
    query.bindValue(":email", email);
    query.bindValue(":first_name", first_name);
    query.bindValue(":last_name", last_name);
    query.bindValue(":sex", sex);
    query.bindValue(":age", age);
    query.bindValue(":salary", salary);
    query.bindValue(":phone_nr", phone_nr);
    query.bindValue(":access_type", access_type);
    if (query.exec()){
        qDebug() << "Employee added to system";
        ui->le_Account->clear();
        ui->le_Age->clear();
        ui->le_Email->clear();
        ui->le_Login->clear();
        ui->le_Name->clear();
        ui->le_Phone->clear();
        ui->le_Psswd->clear();
        ui->le_Salary->clear();
        ui->le_Sex->clear();
        ui->le_Surname->clear();
        ui->stackedWidget->setCurrentIndex(1);
    } else {
        qDebug() << "Error while adding employee";
    }
}


void AdminW::on_cancelBtn_clicked()
{
    ui->le_Account->clear();
    ui->le_Age->clear();
    ui->le_Email->clear();
    ui->le_Login->clear();
    ui->le_Name->clear();
    ui->le_Phone->clear();
    ui->le_Psswd->clear();
    ui->le_Salary->clear();
    ui->le_Sex->clear();
    ui->le_Surname->clear();
    ui->stackedWidget->setCurrentIndex(1);
}

void AdminW::on_deleteEmployeeBtn_clicked()
{
    ui->stackedWidget->setCurrentIndex(5);
}


void AdminW::on_deleteUserBtn_clicked()
{
    QSqlQuery query;
    int ID;
    ID = ui->le_ID->text().toInt();
    QString queryString = "CALL delete_employee(:ID)";
    query.prepare(queryString);
    query.bindValue(":ID", ID);
    if (query.exec()){
        qDebug() << "Employee deleted";
        ui->le_ID->clear();
        ui->stackedWidget->setCurrentIndex(1);
    } else {
        qDebug() << "Error while deleting employee";
    }
}

void AdminW::on_cancelDeleteUserBtn_clicked()
{
    ui->le_ID->clear();
    ui->stackedWidget->setCurrentIndex(1);
}

