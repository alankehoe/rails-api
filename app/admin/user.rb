ActiveAdmin.register User do
  permit_params :name, :username, :admin, :email, :password, :password_confirmation

  menu parent: 'Resources'

  index do
    selectable_column
    column :email
    column :last_seen
    column :sign_in_count
    column :created_at
    actions
  end

  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs 'Admin Details' do
      f.input :name
      f.input :username
      f.input :email
      f.input :password
      f.input :password_confirmation
    end
    f.label 'Admin User '
    f.check_box :admin
    f.actions
  end
end
