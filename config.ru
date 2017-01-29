# encoding: UTF-8

require 'rubygems'
require 'rack'
require 'json'
require 'pp'

require './lib/deep_struct'

require './options_project'
require './db_project'

use Rack::Reloader, 0
use Rack::Static, :urls => ['/public']

require './config.rb'

require './engine/model/ElementAdd.rb'
require './engine/model/ElementsRead.rb'

require './engine/Validator.rb'
require './engine/Environment.rb'
require './engine/MetaController.rb'
require './engine/RenderPage.rb'
require './engine/MegaController.rb'

require './engine/BaseProject.rb'

class Router
  def call(env)
    no_route     = true
    request_path = env['REQUEST_PATH']

    start = MegaController.new env
    
    # > static page
    return start.index if request_path.match(%r{^/$})
    return start.admin if request_path.match(%r{^/admin$})
    return start.user  if request_path.match(%r{^/user$})
    # < end static page

    unless start.env.check
        puts "error: #{start.env.info}"
        return start.error( start.env.info ) 
    end

    return start.element_add  if request_path.match(%r{^/element_add$})

    return start.error( {:bool => false, :code => 8003, :info => "Страница ненайдена - #{request_path}"} ) if no_route
  end 
end
run Router.new()