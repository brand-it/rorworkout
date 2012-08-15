class Doctor < ActiveRecord::Base
  attr_accessible :name, :address, :city, :zip, :state, :years_of_experence
  belongs_to :user
  has_many :degrees
  
  validates_presence_of :name
  validates_length_of :name, :maximum => 35
  validates_length_of :zip, :maximum => 5
  
  accepts_nested_attributes_for :degrees
  
  before_create :set_created_by
  
  private
  
  def set_created_by
    self.created_by = UserSession.find.record.id
  end
end
