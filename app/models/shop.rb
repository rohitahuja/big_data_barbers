class Shop < ActiveRecord::Base
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable,
          :confirmable, :omniauthable
  include DeviseTokenAuth::Concerns::User
  include Permissions

  has_one :shop_profile, inverse_of: :shop
  has_many :professionals, inverse_of: :shop
  has_many :service_details, inverse_of: :shop

  validates :shop_profile, presence: true

  def shop?
  	true
  end

end
