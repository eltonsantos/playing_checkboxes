class Refinancing < ActiveRecord::Base
  belongs_to :employee
  belongs_to :authorization

  enum situation: [:reserved, :endorsed, :canceled]
end
