class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :provider
  has_one :patient

  after_create :determine_role

  def determine_role
    is_provider ? create_as_provider : create_as_patient
  end

  def create_as_provider
    Provider.create(user: self)
  end

  def create_as_patient
    Patient.create(user: self)
  end

end
