class Appointment < ActiveRecord::Base
  # scope :last_appointment, lambda { where("visit_date <= ?", Time.now)}
  
  attr_accessible :visit_date, :requires_reminder, :reason_for_visit, :pet_id
  belongs_to :customer
  belongs_to :pet
  belongs_to :user
  
  validates_presence_of :reason_for_visit
  
  validates_date :visit_date, :after => lambda { Time.now },
                                 :after_message => "must have date that is after greater then today"
  
  
  def self.last_appointment
    self.where("visit_date < ?", Time.now.beginning_of_day).first
  end
  
end
