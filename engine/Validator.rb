# encoding: UTF-8

class Validator
  attr_reader :error
  attr_reader :info
  attr_reader :w
  attr_reader :id

  def initialize(json, props, params)
    @json   = json
    @props  = props
    @params = params
    @error  = true
    @info   = nil
    
    @w = /^([А-ЯЁ]|[а-яё]|\w){2,32}$/
    @id = /^[0-9a-fA-F]{24}$/

    # Валидация роута
    case json['action']
    when 'send_list'
      send_list
    else
      @info = { :bool => false, :code => 8048, :info => "Ошибка валидации - нет роутера для валидации при \"action\"=\"#{json['action']}\"" }
      return @error
    end
  end

  def send_list
    return @info = { :bool => false, :code => 8026, :info => "Ошибка валидации входных данных списка - nameList (send_list) nil" }      if @json['nameList'].nil?
    return @info = { :bool => false, :code => 8006, :info => "Ошибка валидации входных данных списка - nameList (send_list) unmatch" }  unless @json['nameList'].match(@w)
    return @info = { :bool => false, :code => 8033, :info => "Ошибка валидации входных данных списка - nameGroup (send_list) nil" }     if @json['nameGroup'].nil?
    return @info = { :bool => false, :code => 8034, :info => "Ошибка валидации входных данных списка - nameGroup (send_list) unmatch" } unless @json['nameGroup'].match(@w)
    return @info = { :bool => false, :code => 8032, :info => "Ошибка проверте роутер параметров таблицы \"#{@json['nameList']}\"" }     unless @params.set_tablename_by_namelist @json['nameList']
    return @info = { :bool => false, :code => 8041, :info => "Ошибка проверте роутер параметров группы \"#{@json['nameGroup']}\"" }     unless @params.set_group_name_for_list @json['nameGroup']
    return @info = { :bool => false, :code => 8008, :info => "Ошибка валидации входных данных списка - count (send_list) nil" }         if @json['count'].nil? 
    return @info = { :bool => false, :code => 8007, :info => "Ошибка валидации входных данных списка - count, #{@json['count']}" }      if @json['count'] > 99 or @json['count'] < 1
    
    return @error
  end


end