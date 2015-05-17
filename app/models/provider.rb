class Provider < ActiveRecord::Base
  belongs_to :user, dependent: :destroy
  has_many :patients
end
