class CommentsController < ApplicationController


	def create
        @comment = current_user.comments.build(comment_params)
        @comment.post_id = params[:post_id]
        @comment.save
        respond_to do |format|
        	format.html { redirect_to Post.find(params[:post_id]) }
        	format.js
        end
        

        
		#format.js
	end

	def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    respond_to do |format|
    format.html {redirect_to @comment.post}
    format.js
    end
    end

	private 
	def comment_params 
      params.require(:comment).permit(:content)
	end
end
