# Be sure to restart your server when you modify this file

# Specifies gem version of Rails to use when vendor/rails is not present
RAILS_GEM_VERSION = '2.3.5' unless defined? RAILS_GEM_VERSION
POSTMARK_API_KEY_FILE = File.join(RAILS_ROOT, '..', '..', 'shared', 'config', 'postmark_api_key')

# Bootstrap the Rails environment, frameworks, and default configuration
require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|
  config.gem 'haml', :version => '>=2.2'
  config.gem "authlogic"
  config.gem "cancan"
  config.gem 'hoptoad_notifier'
  config.gem 'postmark-rails'
  
  require 'postmark-rails'
  
  config.action_mailer.postmark_api_key = File.read(POSTMARK_API_KEY_FILE).chomp if File.readable? POSTMARK_API_KEY_FILE

  config.time_zone = 'UTC'
end

ActiveSupport::Inflector.inflections do |inflect|
  inflect.irregular 'feedback', 'feedback'
end