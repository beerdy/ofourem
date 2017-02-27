# encoding: UTF-8

require 'slim'
require 'tilt'

template = Tilt.new('template.slim')
puts template.render
some = Slim::Template.new('template.slim', {}).render
puts some