class Pet < ActiveRecord::Base
  attr_accessible :name, :type_of_pet, :breed, :age, :weight
  belongs_to :customer
  has_many :appointments
  
  validates_presence_of :type_of_pet
  validates_length_of :name, :maximum => 35
  validates_length_of :breed, :maximum => 35
  
  validates_presence_of :breed
  validates_presence_of :age
  validates_presence_of :weight
  validates_numericality_of :age
  validates_numericality_of :weight

end
