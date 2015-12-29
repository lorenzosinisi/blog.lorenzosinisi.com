class HomepageController < ApplicationController

  def index
  end

  def about
    @about = About.last
  end

end
