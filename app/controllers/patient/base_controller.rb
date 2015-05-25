class Patient::BaseController < ApplicationController
  before_filter :require_logged_in
  before_filter :require_patient
end
