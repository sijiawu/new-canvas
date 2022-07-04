class ChangeMeetingAttributes < ActiveRecord::Migration[6.1]
  def change
    rename_column :meetings, :title, :permalink
    add_column :meetings, :title, :text
    add_column :meetings, :additional_info, :text
  end
end
