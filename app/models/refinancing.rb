class Refinancing < ActiveRecord::Base
  belongs_to :employee
  belongs_to :authorization

  accepts_nested_attributes_for :authorization

  enum situation: [:reserved, :endorsed, :canceled]
end
