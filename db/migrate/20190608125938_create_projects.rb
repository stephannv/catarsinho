class CreateProjects < ActiveRecord::Migration[6.0]
  def change
    create_table :projects, id: :uuid do |t|
      t.string :title, null: false, length: 80, index: true
      t.decimal :goal, null: false, default: 0.0, precision: 16, scale: 2

      t.timestamps
    end
  end
end
