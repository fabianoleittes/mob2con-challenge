# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name, null: false, default: ''
      t.string :email, null: false, default: '', index: true
      t.string :password_digest, null: false, default: ''
      t.boolean :admin, default: false, null: false, index: true

      t.timestamps
    end
  end
end
