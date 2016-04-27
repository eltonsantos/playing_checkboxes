class Refinancing < ActiveRecord::Base
  before_save :create
  
  belongs_to :employee
  belongs_to :authorization

  accepts_nested_attributes_for :authorization

  enum situation: [:reserved, :annotation, :canceled]

  def create
    self.situation ||= 0
  end

end
