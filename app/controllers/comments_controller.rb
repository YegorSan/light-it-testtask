class CommentsController < ApplicationController
    
    
   
    def new
      @comment = Comment.new
    end

    def create
      @post =  Post.find_by_id(params[:post_id]) if params[:post_id]
      @commentable = Comment.find_by_id(params[:comment_id]) if params[:comment_id]
      @commentable = Post.find_by_id(params[:post_id]) if params[:post_id]
      @comment = @commentable.comments.build(comments_params)
      @comment.user_id = current_user.id

      if @comment.save
        redirect_to :back, notice: 'Your comment was successfully posted!'
      else
        redirect_to :back, notice: "Your comment wasn't posted!"
      end
    end
    
    def destroy
      @comment = Comment.find(params[:id])
      @comment.destroy
      respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
        
    end

    private

    def comments_params
      params.require(:comment).permit(:body, :commentable_id, :commentable_type, :user_id )
    end

    def find_commentable
      @commentable = Comment.find_by_id(params[:comment_id]) if params[:comment_id]
      @commentable = Post.find_by_id(params[:post_id]) if params[:post_id]
    end

end