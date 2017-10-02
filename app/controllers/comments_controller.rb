class CommentsController < ApplicationController
 before_action :authenticate_user!, only: [ :create,:destroy]
 def create
    @topic = Topic.find(params[:topic_id])
    @comment = @topic.comments.new(comment_params)
    @comment.user_id =current_user.id if current_user
    @comment.save
    redirect_to topic_path(@topic)
 end
 def destroy
     @comment = Comment.find(params[:id])
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to topic_path(@comment.topic), notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:comment_body)
    end
end
