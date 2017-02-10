# encoding: UTF-8

class Environment

  attr_reader :request
  attr_reader :rack_input

  attr_reader :validator
  attr_reader :json
  attr_reader :form

  attr_reader :params
  attr_reader :props

  def initialize(environment)
    puts "initialize"
    @rack_input = environment['rack_input']

    form

    @params    = Params.new
    @props     = Props.new @params
    @validator = Validator.new @json, @props, @params
  end

  def json?
    @json.respond_to?(:keys) ? !@json.keys[0].nil? : false 
  end
  def json
    #@rack_input = "fake"
    puts "ENVIROMENT- #{@rack_input} #{rack_input==''}"
    begin
      @json = @rack_input==nil||@rack_input=='' ? {} : JSON.parse(@rack_input)
    rescue => ex
      render :content => { :page_htm => 'p404', :data => JSON.parse(O4.tt.error.json.parse) }
    end
  end

  def form?
    @form_b = @rack_input =~ /form-data/
  end
  def form
    # Пока формой не получаем отдаем {}
    @form = form? ? {} : json
  end
end


class Params
  def initialize
  end
end

# FactoryProps
class Props
  def initialize(params)
    @default_props = {
      :hiden => false,
      #:necessarily => true,
      :regex => /^([А-ЯЁ]|[а-яё]|\w){2,32}$/
    }
  end

  def example
    default_props = { 
      :hiden => false,
      :necessarily => false,
      :regex => /^[\d]{1,12}$/
    }
    description = { 
      :hiden => false,
      :necessarily => true,
      :regex => /^([А-ЯЁа-яё.,\w\s]){4,256}$/
    }
    case 
    when 'снаряжение'
      {
        'Наименование' => description,
        'Сдан'         => { :hiden => false, :necessarily => false, :regex => /^[\d]{1,2}$/  },
        'ИнвНомер'     => default_props,
        'Тариф'        => default_props,
        'Крепление'    => description,
        'Размер'       => { :hiden => false, :necessarily => false, :regex => /^[\d]{1,3}$/  },
        'Цена'         => default_props
      }
    when 'обувь'
      {
        'Наименование' => description,
        'Сдан'         => { :hiden => false, :necessarily => false, :regex => /^[\d]{1,2}$/  },
        'ИнвНомер'     => default_props,
        'Цена'         => default_props,
        'Размер'       => { :hiden => false, :necessarily => false, :regex => /^[\d]{2,2}$/  }
      }
    when 'защита'
      {
        'Наименование' => description,
        'Сдан'         => { :hiden => false, :necessarily => false, :regex => /^[\d]{1,2}$/  },
        'ИнвНомер'     => default_props,
        'Цена'         => default_props
      }
    when 'аксесуары'
      {
        'Наименование' => description,
        'Сдан'         => { :hiden => false, :necessarily => false, :regex => /^[\d]{1,2}$/  },
        'ИнвНомер'     => default_props,
        'Цена'         => default_props
      }
    end
  end
end