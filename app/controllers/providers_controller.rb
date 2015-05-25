class ProvidersController < ApplicationController
  def find_a_provider
    @providers = User.is_a_provider
  end
end
