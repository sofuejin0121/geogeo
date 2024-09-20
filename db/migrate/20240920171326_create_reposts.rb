class CreateReposts < ActiveRecord::Migration[7.0]
  def change
    create_table :reposts do |t|
      t.references :user,       foreign_key: true
      t.references :micropost, foreign_key: true
      t.timestamps
    end
  end
end
