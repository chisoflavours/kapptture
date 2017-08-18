class RateesController < ApplicationController
  before_action :authenticate_creator!
    
  def create
    @kapp = Kapp.friendly.find(params[:kapp_id])
    @ratee = Ratee.create(params[:ratee].permit(:rate))
    @ratee.creator_id = current_creator.id
    @ratee.kapp_id = @kapp.id
        
    if @ratee.save
      redirect_to kapp_path(@kapp)
    else
      render 'new'
    end
  end
  
end
