# encoding: UTF-8

STATUS_DEFAULT = 200
HEADERS_DEFAULT = { 'Content-Type' => 'text/plain', 'charset' => 'utf-8' }
PAGE_HTM_DEFAULT = O4.template.page.index #"./#{PATH_VIEW}/index.htm.erb"
HEADERS_DEFAULT_STATIC = {'Content-Type' => 'text/html', 'charset' => 'utf-8'}


module RenderPage
  # Всегда пока 200

  def render_page(message=nil,env=nil,request)
    type, options = message.first

    # Автовыбор типа отдаваемого контента тупо по post
    #т.е. если post запрос то отдадим json-ом
    type = request.post? ? 'json' : 'file' if type == 'content'

    puts "OPTIONS: #{message} ENV: #{env}, RACK_INPUT: #{request.post?} TYPE #{type}"

    #=========================#
    # -- Обработка статики -- #
    #=========================#
    if message['index']==true
      # По умолчанию index.htm.erb без данных для рендеринга
      # Чтобы отрендерить шаблон index с данными необходимо воспользоваться
      # общей формой рендеринга вида: render :file => { :page_htm => 'index' }
      # puts "INDEX: #{O4.template.page.index}"
      return [STATUS_DEFAULT, HEADERS_DEFAULT_STATIC, [ PAGE_HTM_DEFAULT ]]
    end

    if options['data']

      headers  = options['headers'].nil?  ? (HEADERS_DEFAULT_STATIC) : options['headers']
      page_htm = options['page_htm'].nil? ? (PAGE_HTM_DEFAULT)       : options['page_htm']
      return [STATUS_DEFAULT, headers, [ ERB.new(O4.template.page.instance_eval "#{page_htm}").result( BindPage.new( TestDriver.test(options['data']) ).bind ) ]]

    elsif env.json?

      headers  = options['headers'].nil?  ? (HEADERS_DEFAULT_STATIC) : options['headers']
      page_htm = options['page_htm'].nil? ? (PAGE_HTM_DEFAULT)       : options['page_htm']

      return [STATUS_DEFAULT, headers, [ ERB.new(O4.template.page.instance_eval "#{page_htm}").result( BindPage.new( TestDriver.test(env.json) ).bind ) ]]

    else

      headers  = options['headers'].nil?  ? (HEADERS_DEFAULT_STATIC) : options['headers']
      page_htm = options['page_htm'].nil? ? (PAGE_HTM_DEFAULT)       : options['page_htm']
      
      return [STATUS_DEFAULT, headers, [ IO.read("./#{PATH_VIEW}/#{page_htm}.htm.erb",:encoding => 'UTF-8') ]]
    end if type=='file' or type=='content'

    #=====================================#
    # -- В ином случае это AJAX запрос -- #
    #=====================================#
    if options['data']

      headers = options['headers'].nil? ? (HEADERS_DEFAULT) : options['headers']

      return [STATUS_DEFAULT, headers, [ TestDriver.test(options['data']).to_json ]]

    elsif env.json?
      
      headers = options['headers'].nil? ? (HEADERS_DEFAULT) : options['headers']

      return [STATUS_DEFAULT, headers, [ TestDriver.test(env.json).to_json ]]
    
    else

      headers = options['headers'].nil? ? (HEADERS_DEFAULT) : options['headers']

      return [STATUS_DEFAULT, headers, [ 'Request server: no rendering json' ]]

    end if type=='json'
  end
  module_function :render_page
end

# Биндинг одноуровневый уровень вложенности
class BindPage
  def initialize(data)
    data.each do |key,value|
      puts "KEY: #{key}, VALUE: #{value}"
      instance_variable_set('@'+key, value)
    end
  end
  def bind
    binding
  end
end