# encoding: UTF-8

class Client
  attr_reader :ip, :agent

  def initialize environment
    @ip = IPProject.get_ip environment
    @agent = environment['HTTP_USER_AGENT']
  end
end

class Environment
  attr_accessor :issue
  attr_reader :client

  attr_reader :request
  attr_reader :rack_input

  attr_reader :json
  attr_reader :form

  def initialize environment
    @rack_input = environment['rack_input']
    @client = Client.new environment

  end

  def json?
    @json.respond_to?(:keys) ? !@json.keys[0].nil? : false
  end
  def json
    begin
      @json = @rack_input==nil||@rack_input=='' ? {} : JSON.parse(@rack_input)
    rescue => ex
      render :content => { :page_htm => 'p404', :data => JSON.parse(O4.tt.error.json.parse) }
    end
  end

  def form?
    @form_check ||= @rack_input=~/form-data/
  end
  def params
    # Пока формой не получаем отдаем {}
    @form = form? ? {} : json
  end
end