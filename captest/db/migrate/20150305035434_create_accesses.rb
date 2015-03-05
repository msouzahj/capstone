class CreateAccesses < ActiveRecord::Migration
  def change
    create_table :accesses do |t|
      t.references :meets, index: true
      t.references :seasons, index: true
      t.references :events, index: true

      t.timestamps
    end
  end
end
