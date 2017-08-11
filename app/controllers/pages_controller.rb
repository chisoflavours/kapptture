class PagesController < ApplicationController
  def about
  end

  def dashboard
    @kapp = Kapp.where(creator_id: current_creator)
  end
end
