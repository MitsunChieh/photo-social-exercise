class WelcomeController < ApplicationController

  skip_before_action :authenticate_user!

  def index
    @photo = Photo.all
  end
end
