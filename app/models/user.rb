class User < ActiveRecord::Base
  
  scope :active, where(:active => true)
  scope :confirmed, where(:confirmed => true)
  
  default_scope :limit => 100
  
  attr_accessible :email, :password, :password_confirmation, :first_name, :last_name, :access_level
  acts_as_authentic
  
  validates_uniqueness_of :email
  
  after_create :setup
  
  has_many :doctors, :foreign_key => :created_by
  # This is was going to tell me which customer is the real customer according to the login info
  has_many :customers
  has_many :my_customers, :foreign_key => :created_by, :class_name => Customer
  
  def self.find_by_name(name)
    clean_name = "%" + name + "%"
    self.where("lower(first_name) LIKE ? OR lower(last_name) LIKE ?", clean_name, clean_name)
  end
  
  # Use the data to activate the account
  def activate
    self.update_attribute(:active, true)
  end
  
  def deactivate
    self.update_attribute(:active, false)
  end
  
  def approve
    self.update_attribute(:approved, true)
  end
  
  def disapprove
    self.update_attribute(:approved, false)
  end
  
  def confirm
    self.update_attribute(:confirmed, true)
  end
  
  def unconfirm
    self.update_attribute(:confirmed, false)
  end
  
  def self.for_select
    users = self.all
    users.collect {|u| [ u.email, u.id ] }
  end
  
  def full_name
    unless first_name.nil? && last_name.nil?
      [first_name.capitalize,last_name.capitalize].join(' ')
    else
      return "Unknow?"
    end
  end
  
  private
  
  # Full activated account on create
  def setup
    self.activate
    self.approve
    self.confirm
  end
end
