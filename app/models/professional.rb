class Professional < ActiveRecord::Base
  # Include default devise modules.
  #:confirmable,

  ## TODO
  # Add validation that user must have either professional account or customer account
  # Add uniqueness validations
  # Add presence validations
  # Add length validations
  

  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable,
          :omniauthable
  include DeviseTokenAuth::Concerns::User

  # validates :first_name, :last_name, :email, presence: true
  belongs_to :workplace
  has_one :schedule
  has_many :appointments, through: :schedule
  has_many :availabilities, through: :schedule
  has_many :posts
  accepts_nested_attributes_for :workplace #, reject if: workplace_exists?

  validates :phone_number, presence: true #needs to be unique

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
