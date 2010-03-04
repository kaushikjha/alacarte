require 'yaml'

namespace :db do
  desc "Set up example account (Grotto)"
  task :grotto => :environment do
    if User.find_by_email("grotto@example.com") || Invitation.find_by_recipient_email("grotto@example.com")
      puts "You already have an account/invitation for 'grotto@example.com'"
    else
      TABLES = %w-invitations users menus categories items prices-
      ids = {}
      
      TABLES.each do |table_name|
        path = "#{RAILS_ROOT}/lib/tasks/grotto/" + table_name.to_s + '.yml'
        model_name = ActiveSupport::Inflector.classify table_name
        model_class = ActiveRecord.const_get(model_name)
        
        data = YAML.load(ERB.new(File.read(path)).result binding)
        data.each do |key, value|
          model_instance = model_class.create(value)
          model_instance.errors.each { |attr, msg| puts "#{attr} - #{msg}" } unless model_instance.save
          # model_instance.save
          ids[key] = model_instance.id
        end
        
        puts "Loaded data from #{table_name}.yml"
      end
    end
  end
end