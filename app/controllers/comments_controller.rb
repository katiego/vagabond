class CommentsController < ApplicationController

	def create
		@post = Post.find(params[:post_id])
        @comment = @post.comments.create(comment_params)
        @comment.user_id = current_user.id
        if @comment.save

         else
           flash[:error] = "not working"
           redirect_to post_path(@post)
         end        


        redirect_to post_path(@post)
	end

    def destroy
        @post = Post.find(params[:post_id])
        @comment = @post.comments.find(params[:id])
        @comment.destroy
        redirect_to post_path(@post)
    end

    private
        def comment_params
            params.require(:comment).permit(:body)
        end
end