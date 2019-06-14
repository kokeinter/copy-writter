class CreateApplies < ActiveRecord::Migration[5.2]
  def change
    create_table :applies do |t|
      t.integer :recruit_id, foreign_key: true, null: false
      t.integer :user_id, foreign_key: true, null: false
      t.timestamps
    end
  end
end
