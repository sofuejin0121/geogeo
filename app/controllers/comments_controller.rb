class CommentsController < ApplicationController
  def create
    micropost = Micropost.find(params[:micropost_id])
    comment = current_user.comments.new(comment_params)
    comment.micropost_id = micropost.id
    comment.save

    micropost.create_notification_comment!(current_user, comment.id)

    redirect_to micropost_path(micropost)
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
