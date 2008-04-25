class HomeController < ApplicationController
  def index; redirect_to signup_path; end
  
  def about; end
end