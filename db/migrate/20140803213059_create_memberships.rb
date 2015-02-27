class CreateMemberships < ActiveRecord::Migration
  def change
    create_table :memberships, id: :uuid do |t|
      t.string :permission

      t.uuid       :user_id
      t.uuid       :group_id
      t.timestamps
    end
  end
end
