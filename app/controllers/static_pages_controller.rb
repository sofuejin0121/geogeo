# frozen_string_literal: true

class StaticPagesController < ApplicationController
  def home
    return unless logged_in?

    @micropost = current_user.microposts.build
    @feed_items = if params[:area].present?
                     current_user.feed.where(area: params[:area]).page(params[:page])
                  else
                      current_user.feed.page(params[:page])
                  end
    
  end

  def help; end

  def about; end

  def contact; end
end
