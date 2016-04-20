# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Person.create name: "Elton", cpf: "11111111111"
Person.create name: "Eloy", cpf: "22222222222"

Employee.create person_id: 1, register: "01020304", salary: 2000
Employee.create person_id: 1, register: "02030405", salary: 3000
Employee.create person_id: 2, register: "03040506", salary: 4000

Authorization.create employee_id: 1, contract_number: 11, total_value: 1000, parcel_value: 100, qtd_parcel: 10
Authorization.create employee_id: 1, contract_number: 22, total_value: 2000, parcel_value: 200, qtd_parcel: 20
Authorization.create employee_id: 2, contract_number: 33, total_value: 3000, parcel_value: 300, qtd_parcel: 30
Authorization.create employee_id: 3, contract_number: 55, total_value: 5000, parcel_value: 500, qtd_parcel: 50
