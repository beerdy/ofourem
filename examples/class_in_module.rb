# encoding: UTF-8

module App
  module Env
    def index
      'index'
    end
    extend self
  end
end
class Env
  def index
    'index2'
  end
end

include App

puts App::Env.index
puts Env.new().index