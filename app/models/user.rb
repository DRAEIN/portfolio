class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :name

  def first_name
  	self.name.split.first  #takes the specific name (self) splits by spacing then takes the first name out of the array.
  end

  def last_name
  	self.name.split.last 
  end
end
