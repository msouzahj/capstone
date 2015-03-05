class CreateTimers < ActiveRecord::Migration
  def change
    create_table :timers do |t|
      t.string :saved_times
      t.references :user, index: true

      t.timestamps
    end
  end
end
