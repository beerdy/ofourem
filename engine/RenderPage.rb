# encoding: UTF-8

require './TestDriver.rb'

module RenderPage
  STATUS_DEFAULT         = 200
  HEADERS_DEFAULT        = { 'Content-Type' => 'text/plain' }
  PAGE_HTM_DEFAULT       = './view/index.htm'
  HEADERS_DEFAULT_STATIC = {'Content-Type' => 'text/html', 'charset' => 'utf-8'}

  def render_page(options=nil)
    if options.nil? # for default page
      static   = true
      status   = STATUS_DEFAULT
      headers  = HEADERS_DEFAULT_STATIC
      page_htm = PAGE_HTM_DEFAULT
    else

      if options[:page_htm].nil?
        static  = false
        headers = (options[:headers].nil?) ? (HEADERS_DEFAULT) : options[:headers]  
      else
        static   = true
        headers  = (options[:headers].nil?) ? (HEADERS_DEFAULT_STATIC) : options[:headers]
        page_htm = options[:page_htm]
      end
      
      status = (options[:status].nil?) ? (STATUS_DEFAULT) : options[:status]  

    end

    if static
      return [status, headers, [ IO.read( page_htm ) ]]
    else
      return [status, headers, [ TestDriver.test( options[:data], @env ).to_json ]]
    end

  end
  module_function :render_page
end