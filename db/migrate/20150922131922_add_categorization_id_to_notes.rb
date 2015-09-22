class AddCategorizationIdToNotes < ActiveRecord::Migration
  def change
    add_column :notes, :categorization_id, :integer
  end
end
