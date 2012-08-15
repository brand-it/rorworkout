class User < ActiveRecord::Base
  
  scope :active, where(:active => true)
  scope :confirmed, where(:confirmed => true)
  
  default_scope :limit => 100
  
  attr_accessible :email, :password, :password_confirmation, :first_name, :last_name
  acts_as_authentic
  
  validates_uniqueness_of :email
  
  after_create :setup
  
  has_many :doctors, :foreign_key => :created_by
  
  # Not used in this login keep if you want to use later.
  # def create_using_auth(auth)
  #    User.create(:email => auth['info']['email'], :first_name => auth['info']['first_name'], :last_name => auth['info']['last_name'], :password => auth['credentials']['token'], :password_confirmation => auth['credentials']['token'])  
  # end
  # 
  # def facebook_img_uri
  #   return "https://graph.facebook.com/" + self.facebook.uid.to_s + "/picture?type=large" unless self.facebook.blank?
  # end
  
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
    users = self.find_admin_clients
    users.collect {|u| [ u.full_name, u.id ] }
  end
  
  def full_name
    unless first_name.nil? && last_name.nil?
      [first_name.capitalize,last_name.capitalize].join(' ')
    else
      return nil
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
