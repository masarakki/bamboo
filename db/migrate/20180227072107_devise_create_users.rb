# frozen_string_literal: true

class DeviseCreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.integer :uid, null: false
      t.string  :screen_name, null: false
      t.string  :access_token, null: false
      t.string  :secret_token, null: false
      t.integer :vote_id
      t.timestamp :voted_at, null: true
      t.timestamps null: false
      t.index :uid, unique: true
    end
  end
end
