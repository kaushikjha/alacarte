require 'yaml'

namespace :db do
  desc "Set up example account (Grotto)"
  task :grotto => :environment do
    if User.find_by_email("grotto@example.com")
      puts "You already have an account for 'grotto@example.com'"
    else
      TABLES = %w-invitations users menus categories items prices-
      
      TABLES.each do |table_name|
        path = "#{RAILS_ROOT}/lib/tasks/grotto/" + table_name.to_s + '.yml'
        model_name = ActiveSupport::Inflector.classify table_name
        model_class = ActiveRecord.const_get(model_name)
        
        data = YAML.load_file(path)
        data.each do |key, value|
          model_instance = model_class.create(value)
          model_instance.save
        end
        
        puts "Loaded data from #{table_name}.yml"
      end
    end
  end
end