class Repost < ApplicationRecord
    belongs_to :user 
    belongs_to :micropost, counter_cache: :reposts_count
end
