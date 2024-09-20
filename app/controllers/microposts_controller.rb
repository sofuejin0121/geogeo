# frozen_string_literal: true

class MicropostsController < ApplicationController
  before_action :logged_in_user, only: %i[create destroy]
  before_action :correct_user, only: :destroy

  def show
    @micropost = Micropost.find(params[:id])
    @comment = Comment.new
  end

  def create
    @micropost = current_user.microposts.build(micropost_params)
    @micropost.image.attach(params[:micropost][:image])
    if @micropost.save
      flash[:success] = 'Micropost created!'
      redirect_to root_url
    else
      @feed_items = current_user.feed.page(params[:page])
      render 'static_pages/home', status: :unprocessable_entity
    end
  end

  def destroy
    @micropost.destroy
    flash[:sucess] = 'Micropost deleted'
    if request.referer.nil?
      redirect_to root_url, status: :see_other
    else
      redirect_to request.referer, status: :see_other
    end
  end

  def search
    Rails.logger.debug params[:content]
    @microposts = Micropost.where('content LIKE ?', "%#{params[:content]}%")
    render 'microposts/search'
  end

  private

  def micropost_params
    params.require(:micropost).permit(:content, :image, :area)
  end

  def correct_user
    @micropost = current_user.microposts.find_by(id: params[:id])
    redirect_to root_url, status: :see_other if @micropost.nil?
  end
end
