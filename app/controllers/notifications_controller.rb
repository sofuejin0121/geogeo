# frozen_string_literal: true

class NotificationsController < ApplicationController
  def index
    @notifications = current_user.passive_notifications.page(params[:page])
    @notifications.where(checked: false).find_each do |notification|
      notification.update_attribute(:checked, true)
    end
  end
end
