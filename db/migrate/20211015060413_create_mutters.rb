class CreateMutters < ActiveRecord::Migration[6.1]
  def change
    create_table :mutters do |t|
      t.text :content
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
    add_index :mutters, [:user_id, :created_at]
  end
end
