class CreateRecruits < ActiveRecord::Migration[5.2]
  def change
    create_table :recruits do |t|
      t.string :job, null: false
      t.string :address, null: false
      t.string :salary, null: false
      t.string :image
      t.integer :company_id, foreign_key: true, null: false
      t.timestamps
    end
  end
end
