class Degree < ActiveRecord::Base
  attr_accessible :school_name, :name
  validates_presence_of :name
  validates_presence_of :school_name
  belongs_to :doctor
end
