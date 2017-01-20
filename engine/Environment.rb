# encoding: UTF-8

class Environment
  attr_reader :validator
  attr_reader :form_bool
  attr_reader :json

  attr_reader :params
  attr_reader :props

  def initialize(environment)
    request = Rack::Request.new(environment)
    @rack_input = environment["rack.input"].read

    @form_bool = ( @rack_input =~ /form-data/ )

    # Пока формой не получаем отдаем {}
    @form_bool ? @json={} : @json=json

    @params    = Params.new()
    @props     = Props.new( @params )
    @validator = Validator.new( @json, @props, @params )
  end

  def json
    begin
      @json = JSON.parse(@rack_input)
    rescue => ex
      @json = { :bool => false, :code => 8004, :info => 'Ошибка полученны данных от клиента в формате JSON' }
    end
  end
end


class Params
  def initialize
  end

  def def1(value)
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

    @params = params
  end

  def get(props_name=nil)
    eval( props_name )
  end

  def client
    default_props = { 
      :hiden => false,
      :necessarily => true,
      :regex => /^([А-ЯЁа-яё.,\w\s]){4,64}$/
    }

    {
      "Фамилия"    => @default_props,
      "Имя"        => @default_props,
      "Отчество"   => @default_props,
      "СНПаспорта" => @default_props,
      "КогдаКемВыдан" => default_props,
      "Прописка"      => default_props,
      "Примечание"    => default_props,
      "Телефон" => {
        :unic => true,
        :hiden => false,
        :necessarily => true,
        :regex => /^[\d]{4,12}$/
      },
      "ДРождения" => {
        :hiden => false,
        #:necessarily => true,
        :regex => /^[\d]{2}.[\d]{2}.[\d]{4}$/
      },
      "Депозит" => {
        :unic => true,
        :hiden => false,
        :necessarily => true,
        :regex => /^[\d]{4,12}$/
      },
      "group" => default_props
    }
  end


  def invent
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
    case @params.group_name
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