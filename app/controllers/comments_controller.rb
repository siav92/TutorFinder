class CommentsController < ApplicationController
	
    def create
        @comment = Comment.create(comment_params)
        redirect_to (:back)
	end

	def destroy
		x = session[:user_id]
		@current_user = User.find(x)	
    	@comment = Comment.find(params[:id])
    	@comment.destroy
    	redirect_to (:back)
	end 
    
    private
    def comment_params
        params.require(:comment).permit(:body, :post_id, :user_id)
	end
end




