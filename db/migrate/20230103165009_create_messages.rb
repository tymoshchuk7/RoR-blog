class CreateMessages < ActiveRecord::Migration[7.0]
  def change
    create_table :messages do |t|
      t.references :dialogue, null: false, foreign_key: true
      t.text :user, null: false

      t.timestamps
    end
  end
end
