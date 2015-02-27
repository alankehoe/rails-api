class AddGravatarToGroup < ActiveRecord::Migration
  def change
    add_column :groups, :gravatar, :string
  end
end
