class Doctor < ActiveRecord::Base
  attr_accessible :name, :address, :city, :zip, :state, :years_of_experience, :degrees_attributes
  belongs_to :user, :foreign_key => :created_by
  has_many :degrees
  
  validates_presence_of :name
  validates_length_of :name, :maximum => 35
  validates_length_of :zip, :maximum => 5
  validates_numericality_of :years_of_experience, :greater_than_or_equal_to => 1, :less_than_or_equal_to => 100
  
  accepts_nested_attributes_for :degrees
  
  before_create :set_created_by
  
  private
  
  def set_created_by
    self.created_by = UserSession.find.record.id
  end
end
