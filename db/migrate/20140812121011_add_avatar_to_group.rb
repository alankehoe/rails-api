class AddAvatarToGroup < ActiveRecord::Migration
  def change
    add_column :groups, :avatar, :string
  end
end
