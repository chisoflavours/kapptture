class CommentsController < ApplicationController
    before_action :authenticate_creator!
    
    def create
        @kapp = Kapp.find(params[:kapp_id])
        @comment = Comment.create(params[:comment].permit(:content))
        @comment.creator_id = current_creator.id
        @comment.kapp_id = @kapp.id
        
        if @comment.save
            redirect_to kapp_path(@kapp)
        else
            render 'new'
        end
    end
end
