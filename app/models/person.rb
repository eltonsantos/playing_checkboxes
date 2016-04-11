class Person < ActiveRecord::Base
  has_many :employees

  scope :search_cpf, -> (cpf) { where("cpf like ?", "%#{cpf}%") }
end
