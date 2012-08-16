class Customer < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :doctor_id, :user_id
  belongs_to :created_by, :foreign_key => :created_by
  
  validates_presence_of :first_name
  validates_presence_of :last_name
  
  before_create :set_created_by
  
  has_many :pets
  has_many :appointments
  belongs_to :user
  
  def full_name
    unless first_name.nil? && last_name.nil?
      [first_name.capitalize,last_name.capitalize].join(' ')
    else
      return "Unknow?"
    end
  end
  
  private
  
  def set_created_by
    self.created_by = UserSession.find.record.id
  end
end
