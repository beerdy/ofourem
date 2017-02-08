# encoding: UTF-8

module RenderPage
  # Всегда пока 200
  STATUS_DEFAULT = 200
  HEADERS_DEFAULT = { 'Content-Type' => 'text/plain' }
  PATH_VIEW = 'view'
  PAGE_HTM_DEFAULT = "./#{PATH_VIEW}/index.htm.erb"
  HEADERS_DEFAULT_STATIC = {'Content-Type' => 'text/html', 'charset' => 'utf-8'}

  def render_page(options=nil,env)
    puts "OPTIONS: #{options}, #{env.json?}: #{env.json}"
    
    #=========================#
    # -- Обработка статики -- #
    #=========================#
    if options.nil? or options['index'] == true

      # По умолчанию index.htm.erb без данных для рендеринга
      # Чтобы отрендерить шаблон index с данными необходимо воспользоваться
      # общей формой рендеринга вида: render :file => { :page_htm => 'index' }
      return [STATUS_DEFAULT, HEADERS_DEFAULT_STATIC, [ IO.read(PAGE_HTM_DEFAULT) ]]

    elsif (options['static']==true or options['page_htm']) and options['data']

      headers  = options['headers'].nil?  ? (HEADERS_DEFAULT_STATIC) : options['headers']
      page_htm = options['page_htm'].nil? ? (PAGE_HTM_DEFAULT)       : options['page_htm']

      return [STATUS_DEFAULT, headers, [ ERB.new(IO.read("./#{PATH_VIEW}/#{page_htm}.htm.erb")).result( BindPage.new( TestDriver.test(options['data']) ).bind ) ]]

    elsif options['static']==true or options['page_htm']

      headers  = options['headers'].nil?  ? (HEADERS_DEFAULT_STATIC) : options['headers']
      page_htm = options['page_htm'].nil? ? (PAGE_HTM_DEFAULT)       : options['page_htm']
      
      return [STATUS_DEFAULT, headers, [ IO.read("./#{PATH_VIEW}/#{page_htm}.htm.erb") ]]
    end unless env.json?

    #=====================================#
    # -- В ином случае это AJAX запрос -- #
    #=====================================#
    if !options['static']==true and options['data']
      headers = options['headers'].nil? ? (HEADERS_DEFAULT) : options['headers']

      return [STATUS_DEFAULT, headers, [ TestDriver.test(options['data']).to_json ]]

    end
  end
  module_function :render_page
end

# Биндинг одноуровневый уровень вложенности
class BindPage
  def initialize(data)
    data.each do |key,value|
      instance_variable_set('@'+key, value)
    end
  end
  def bind
    binding
  end
end