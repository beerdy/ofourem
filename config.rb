# encoding: UTF-8

require 'yaml'
require 'rubygems'
require 'eventmachine'
require 'rack'
require 'thin'
require 'faye/websocket'
require 'permessage_deflate'
require 'json'
require 'oj'
require 'pp'
require 'erb'
require 'mongo'
require 'vkontakte_api'

include ERB::Util
include OptionsProject
include DbProject

# Все опции которые не изменяются на протяжение всего хода выполнения - константы
locale = 'ru'

O4 = init_o4(locale)

# Aliase for options
O4ptions = O4

O4_Root = "http://#{O4.prefix}.otklik.pw"

init_db( O4 )