ActiveAdmin.register_page 'Sidekiq' do
  menu parent: 'Monitoring'

  content do
    render partial: 'index'
  end
end