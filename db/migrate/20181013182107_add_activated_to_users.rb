class AddActivatedToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :activated, :boolean, default: false
    add_column :users, :api_key, :string
  end
end