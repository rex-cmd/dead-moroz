# frozen_string_literal: true

class AddBehaviorToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :behavior, :text, limit: 300
  end
end
