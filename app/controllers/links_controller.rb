class LinksController < ApplicationController
def upvote
  @link = Topic.find(params[:id])
  if current_user.voted_up_on? @link
  @link.unliked_by current_user
else
  @link.liked_by current_user
end
  redirect_to Topic.find(params[:id])
end

def downvote
  @link = Topic.find(params[:id])
  if current_user.voted_down_on? @link
  @link.undisliked_by current_user
else
  @link.disliked_by current_user
end
  redirect_to Topic.find(params[:id])
end
end