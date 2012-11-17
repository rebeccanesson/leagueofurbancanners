class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  has_one :person
  accepts_nested_attributes_for :person
  
  before_save :default_role

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :role, :person_attributes
  
  ROLES = %w[member organizer admin]
  
  def default_role
    self.role = "member" unless role
  end
  
  def admin?
    role == "admin"
  end
  
  def organizer? 
      role == "admin" || role == "organizer"
  end
     
  
end
