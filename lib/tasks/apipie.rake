require 'fileutils'
require 'json'

namespace :apipie do
  desc 'Generate example responses'
  task :generate_examples => :environment do
    FileUtils.rm_rf('public/docs')
    Dir.glob('app/views/**/*.rabl').each do |file|
      if match = file.match(/(create|index|show|update|destroy)/)
        action = match[0]
        path_nodes = file.split('/')
        2.times { path_nodes.shift }
        path_nodes.pop
        view_path = path_nodes.join '/'
        classified = path_nodes.last.classify
        MAPPER = {'Me' => 'User'}
        model_name = MAPPER[classified] ? MAPPER[classified] : classified

        if action == 'index' && model_name != 'Me'
          model = FactoryGirl.create_list model_name.downcase.to_sym, 3
        else
          model = FactoryGirl.create model_name.downcase.to_sym
        end

        FileUtils.mkdir_p(File.dirname("public/docs/#{view_path}/#{action}"))

        [:json, :xml].each do |format|
          view = Rabl::Renderer.send(format, model, "#{view_path}/#{action}", {:view_path => 'app/views'})

          File.open("public/docs/#{view_path}/#{action}.#{format}", "w") do |file|
            file.write format == :json ? JSON.pretty_generate(JSON.load(view)) : view
          end

          puts "public/docs/#{view_path}/#{action}.#{format}"
        end
      end
    end
  end
end