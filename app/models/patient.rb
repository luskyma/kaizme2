class Patient < ActiveRecord::Base
  belongs_to :provider
  belongs_to :user, dependent: :destroy
end
