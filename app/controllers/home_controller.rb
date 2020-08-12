class HomeController < ApplicationController
  before_action :require_user
  
  def index
    @accounts = Account.all
  end
end
