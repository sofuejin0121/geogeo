# frozen_string_literal: true

class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.integer :user_id, null: false
      t.integer :micropost_id, null: false
      t.text :content, null: false

      t.timestamps
    end
  end
end
