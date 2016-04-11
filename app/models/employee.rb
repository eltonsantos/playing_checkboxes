class Employee < ActiveRecord::Base
  belongs_to :person
  has_many :refinancings

  scope :search_cpf, -> (cpf) { joins(:person).where("people.cpf LIKE ?", "%#{cpf}%") }

end
