ActiveAdmin.register Doorkeeper::AccessGrant do
  permit_params :resource_owner_id, :application_id, :expires_in

  menu parent: 'Doorkeeper', priority: 2

  index do
    selectable_column
    column :resource_owner_id
    column :application_id
    column :expires_in
    column :redirect_uri
    actions
  end

  filter :resource_owner_id
end
