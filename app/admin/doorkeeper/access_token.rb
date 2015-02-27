ActiveAdmin.register Doorkeeper::AccessToken do
  permit_params :resource_owner_id, :application_id, :expires_in

  menu parent: 'Doorkeeper', priority: 1

  index do
    selectable_column
    column :resource_owner_id
    column :application_id
    column :expires_in
    actions
  end

  filter :resource_owner_id
end
