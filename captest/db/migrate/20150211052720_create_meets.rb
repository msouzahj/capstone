class CreateMeets < ActiveRecord::Migration
  def change
    create_table :meets do |t|
      t.string :name
      t.date :date
      t.text :notes
      t.references :season, index: true

      t.timestamps
    end
  end
end
