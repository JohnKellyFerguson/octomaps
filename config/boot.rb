# Defines our constants
PADRINO_ENV  = ENV['PADRINO_ENV'] ||= ENV['RACK_ENV'] ||= 'development'  unless defined?(PADRINO_ENV)
PADRINO_ROOT = File.expand_path('../..', __FILE__) unless defined?(PADRINO_ROOT)

# Load our dependencies
require 'rubygems' unless defined?(Gem)
require 'bundler/setup'
Bundler.require(:default, PADRINO_ENV)

# # Use Dotenv
unless PADRINO_ENV == 'production'
  require 'dotenv'
  Dotenv.load '.env'
end


##
# ## Enable devel logging
#
# Padrino::Logger::Config[:development][:log_level]  = :devel
# Padrino::Logger::Config[:development][:log_static] = true
#
# ## Configure your I18n
#
# I18n.default_locale = :en
#
# ## Configure your HTML5 data helpers
#
# Padrino::Helpers::TagHelpers::DATA_ATTRIBUTES.push(:dialog)
# text_field :foo, :dialog => true
# Generates: <input type="text" data-dialog="true" name="foo" />
#
# ## Add helpers to mailer
#
# Mail::Message.class_eval do
#   include Padrino::Helpers::NumberHelpers
#   include Padrino::Helpers::TranslationHelpers
# end

Padrino.require_dependencies(Padrino.root('services/*.rb'))
##
# Add your before (RE)load hooks here
#
# Padrino.before_load do
#   CONFIG = YAML.load_file("#{Padrino.root}/config/config.yml")[PADRINO_ENV]
# end

##
# Add your after (RE)load hooks here
#
# Padrino.after_load do
#   Padrino.dependencies << Padrino.root('services/*.rb')
# end

Padrino.load!
