class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  has_one :provider
  has_one :patient

  after_create :determine_role

  scope :is_a_provider, -> { User.where is_provider: true }

  def determine_role
    is_provider ? create_as_provider : create_as_patient
  end

  def create_as_provider
    Provider.create(user: self)
  end

  def create_as_patient
    Patient.create(user: self)
  end

  # def generate(days, time)
  #   days.each do |day, avaliable|
  #     if day == "1"

  #       Time.new.next(day)
  #       (time["start(4i)"]..time["end(4i)"]).each do |t|
  #         # Appointment.create(provider_id: self.provider.id, datetime: -----)
  #         #<APPOINTMENT190237102xxxasha:   @day = "Monday"    @time="8">
  #       end
  #     end
  #   end
  # end
end









