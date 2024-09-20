class AddRepostsCountToMicroposts < ActiveRecord::Migration[7.0]
  def change
    add_column :microposts, :reposts_count, :integer
  end
end
