ActiveAdmin.register Doorkeeper::Application do
  permit_params :name, :uid, :secret, :redirect_uri

  menu parent: 'Doorkeeper', priority: 0

  index do
    selectable_column
    column :name
    column :redirect_uri
    actions
  end

  filter :name

  form do |f|
    f.inputs 'Application Details' do
      f.input :name
      f.input :redirect_uri
    end
    f.actions
  end
end
