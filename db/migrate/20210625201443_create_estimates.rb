# frozen_string_literal: true

class CreateEstimates < ActiveRecord::Migration[6.1]
  def change
    create_table :estimates do |t|
      t.integer    :value,   null: false, limit: 1
      t.text       :comment, limit: 280
      t.belongs_to :author,  foreign_key: { to_table: 'users' }
      t.belongs_to :target,  null: false, foreign_key: { to_table: 'users' }

      t.timestamps
    end
    add_index :estimates, %i[author_id target_id], unique: true
  end
end
