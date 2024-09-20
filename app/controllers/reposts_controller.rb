class RepostsController < ApplicationController
  before_action :correct_user, only: %i[edit update]
  def create
    micropost = Micropost.find(params[:micropost_id])
    repost = current_user.reposts.build(micropost:)
    if repost.save
      micropost.touch
      flash[:success] = 'リポストしました。'
    else
      flash[:error] = 'リポストに失敗しました。'
    end
    redirect_to root_path
  end

  def destroy
    micropost = Micropost.find(params[:micropost_id])
    Repost.find_by(user_id: current_user.id, micropost_id: micropost.id).destroy
    flash[:success] = 'リポストを取り消しました'
    Micropost.find(micropost.id).update_attribute(:updated_at, Time.now)

    redirect_to root_path
  end
end
