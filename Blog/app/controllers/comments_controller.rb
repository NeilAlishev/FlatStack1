class CommentsController < ApplicationController


	def create
        comment = current_user.comments.build(comment_params)
        comment.post_id = params[:post_id]
        comment.save
        redirect_to Post.find(params[:post_id]) 
        
		#format.js
	end

	private 
	def comment_params 
      params.require(:comment).permit(:content)
	end
end
