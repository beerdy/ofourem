# encoding: UTF-8

require 'yaml'

config = YAML::load( File.read('some.yml') )
puts config['ru']['image']