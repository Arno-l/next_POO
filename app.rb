require 'bundler'
Bundler.require

require_relative 'lib/router_admin'
require_relative 'lib/controller_item'
require_relative 'lib/router_client'
require_relative 'lib/item'
require_relative 'lib/view'

RouterClient.new.perform