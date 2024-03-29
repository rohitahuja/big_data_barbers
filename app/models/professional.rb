class Professional < ActiveRecord::Base
  # Include default devise modules.
  #:confirmable,
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable,
          :omniauthable
  include DeviseTokenAuth::Concerns::User
  include User::Permissions

  belongs_to :shop, inverse_of: :professionals
  has_one :schedule, inverse_of: :professional
  has_one :professional_profile, inverse_of: :professional
  has_many :appointments, through: :schedule
  has_many :availabilities, through: :schedule
  has_many :service_details, inverse_of: :professional
  accepts_nested_attributes_for :professional_profile #, reject if: workplace_exists?

  phony_normalize :phone_number, default_country_code: 'US'

  validates :first_name, :last_name, :email, presence: true # :workplace
  validates :phone_number, presence: true, uniqueness: true, phony_plausible: true #needs to be unique
  # validates :bio, length: { maximum: 500 } # if long bios are a problem

  mount_uploader :profile_image, ImageUploader

  after_create do |professional|
    professional.create_schedule
  end

  def name
  	first_name + " " + last_name
  end

  def profile
    professional_profile
  end

  def professional?
    true
  end

end
