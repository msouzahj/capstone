class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.string :results
      t.references :meet, index: true

      t.timestamps
    end
  end
end
