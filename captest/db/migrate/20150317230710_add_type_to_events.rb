class AddTypeToEvents < ActiveRecord::Migration
  def change
    add_column :events, :type, :boolean
  end
end
