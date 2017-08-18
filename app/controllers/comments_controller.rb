class CommentsController < ApplicationController
    before_action :authenticate_creator!
    before_action :find_comment, only: [:destroy]
    
    def create
        @kapp = Kapp.friendly.find(params[:kapp_id])
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
