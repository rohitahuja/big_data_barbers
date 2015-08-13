class Professional < ActiveRecord::Base
  # Include default devise modules.
  #:confirmable,
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable,
          :omniauthable
  include DeviseTokenAuth::Concerns::User

  belongs_to :workplace, inverse_of: :professionals
  has_one :schedule, inverse_of: :professional
  has_many :appointments, through: :schedule
  has_many :availabilities, through: :schedule
  has_many :posts, inverse_of: :professional
  accepts_nested_attributes_for :workplace #, reject if: workplace_exists?

  phony_normalize :phone_number, default_country_code: 'US'

  validates :first_name, :last_name, :email, :workplace, presence: true
  validates :phone_number, presence: true, uniqueness: true, phony_plausible: true #needs to be unique
  # validates :bio, length: { maximum: 500 } # if long bios are a problem

  mount_uploader :profile_image, ImageUploader

  after_create do |professional|
    professional.create_schedule
  end

  def name
  	self.first_name + " " + self.last_name
  end

  def professional?
    true
  end

end
