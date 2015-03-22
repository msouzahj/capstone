class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.string :title
      t.text :input
      t.references :user, index: true

      t.timestamps
    end
  end
end
