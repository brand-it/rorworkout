class Degree < ActiveRecord::Base
  attr_accessible :school_name, :name
  
  belongs_to :doctor
end
