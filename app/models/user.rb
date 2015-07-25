class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :recoverable, :validatable

  after_create :update_access_token!

  # validates :first_name, :last_name, :email, presence: true

  has_one :professional_account
  accepts_nested_attributes_for :professional_account

  def name
  	self.first_name + " " + self.last_name
  end

  def schedule
    self.professional_account.schedule
  end

  private

    def update_access_token!
      self.access_token = '#{ self.id }:#{ Devise.friendly_token }'
      save
    end

end
