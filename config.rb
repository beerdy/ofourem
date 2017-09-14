# encoding: UTF-8

require 'yaml'
require 'rubygems'
require 'rack'
require 'json'
require 'oj'
require 'pp'
require 'erb'
require 'mongo'
require 'vkontakte_api'

include OptionsProject
include DbProject

# Все опции которые не изменяются на протяжение всего хода выполнения - константы
locale = 'ru'

O4 = init_o4(locale)

O4_Root = "http://#{O4.prefix}.otklik.pw"

init_db( O4 )