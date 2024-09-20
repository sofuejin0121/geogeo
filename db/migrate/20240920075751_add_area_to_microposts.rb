class AddAreaToMicroposts < ActiveRecord::Migration[7.0]
  def change
    add_column :microposts, :area, :string
  end
end
