class WelcomeController < ApplicationController

  skip_before_action :authenticate_user!

  def index
    @photo = Photo.order("id DESC")
  end
end
