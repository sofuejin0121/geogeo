# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :micropost

  has_many :notifications, dependent: :destroy
end
