class KappsController < ApplicationController
    before_action :find_kapp, only: [:show,:edit,:update,:destroy, :upvote, :downvote]
    before_action :authenticate_creator!, except: [:index, :show]
    
    def index
      if params[:category].blank?
        @kapp = Kapp.all.order("RANDOM()")
      else
        @category_id = Category.find_by(name: params[:category]).id
        @kapp = Kapp.where(category_id: @category_id).order("RANDOM()")
      end
    end
    
    def show
        @comments = Comment.where(kapp_id: @kapp)
    end
    
    def new
        @kapp = current_creator.kapps.build
    end
    
    def create
        @kapp = current_creator.kapps.build(kapp_params)
        
        if @kapp.save
            redirect_to @kapp
        else
            render 'new'
        end
    end
    
    def edit
    end
    
    def update
        if @kapp.update(kapp_params)
            redirect_to @kapp
        else
            render 'edit'
        end
    end
    
    def destroy
        @kapp.destroy
        redirect_to root_path
    end
    
    def upvote
        @kapp.upvote_by current_creator
        redirect_to :back
    end
    
    def downvote
        @kapp.downvote_by current_creator
        redirect_to :back
    end
    
    private
    
    def find_kapp
        @kapp= Kapp.friendly.find(params[:id])
    end
    
    def kapp_params
        params.require(:kapp).permit(:title, :description, :thumbnail, :category_id, :slug)
    end
end