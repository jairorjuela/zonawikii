class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :name
      t.string :priority
      t.boolean :done, default: false

      t.timestamps null: false
    end
  end
end
