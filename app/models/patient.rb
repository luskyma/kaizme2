class Patient < ActiveRecord::Base
  belongs_to :provider
  belongs_to :user, dependent: :destroy
  has_many :appointments

  def assign_provider(id)
    update_attribute :provider_id, id
  end
end
