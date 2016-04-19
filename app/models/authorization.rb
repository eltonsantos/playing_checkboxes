class Authorization < ActiveRecord::Base
  belongs_to :employee

  serialize :value_solve, Array

  scope :search_employee_by_cpf, -> (cpf) { Authorization.joins("INNER JOIN employees ON employees.id = authorizations.employee_id INNER JOIN people ON employees.person_id = people.id").where("people.cpf LIKE ?", "%#{cpf}%") }

  enum situation: [:aproved, :disapproved, :reversed, :settled]
end
