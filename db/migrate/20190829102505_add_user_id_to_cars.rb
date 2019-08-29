class AddUserIdToCars < ActiveRecord::Migration[6.0]
  def change
    add_column :cars, :user_id, :integer
  end
end
