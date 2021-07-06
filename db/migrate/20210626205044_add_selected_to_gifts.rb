# frozen_string_literal: true

class AddSelectedToGifts < ActiveRecord::Migration[6.1]
  def change
    add_column :gifts, :selected, :boolean, default: false
  end
end
