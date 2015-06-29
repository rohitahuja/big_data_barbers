class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :first_name, :last_name, presence: true

  has_one :professional_account
  accepts_nested_attributes_for :professional_account

  def name
  	self.first_name + " " + self.last_name
  end

  def schedule
    self.professional_account.schedule
  end

end
