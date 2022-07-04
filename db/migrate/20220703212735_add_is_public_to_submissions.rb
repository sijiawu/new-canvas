class AddIsPublicToSubmissions < ActiveRecord::Migration[6.1]
  def change
    add_column :submissions, :is_public, :boolean, default: false
  end
end
