# encoding: UTF-8

class SendTable
  attr_reader :result
  
  def initialize(env)
    @env = env

    @result = { :bool => true, :code => 9002, :action => 'send_table', :info => "Попытка добавления данных в таблицу - #{@env.json['nameList']}, завершена успешно" }
  end

  def send_table
    
    options = @env.params.table_options
    schema  = get_schema

    primary_key = options[:primary_key]

    return new_table( schema ) if schema[primary_key].nil?

    primary_key_value = schema[primary_key]

    request = { primary_key => primary_key_value }

    data = $db_project[@env.params.table_name].find( request ).first
    
    return new_table( schema ) if data.nil?

    schema.delete( primary_key )

    update_table( request, schema )

    @result = { :bool => true, :code => 9012, :action => 'update_table', :info => "Попытка обновления данных - #{@env.json['nameList']}, завершена успешно" }
  end

private

  def new_table(schema)
    $db_project[@env.params.table_name].insert_one( schema )
  end

  def update_table(request, schema)
    $db_project[@env.params.table_name].update_one( request, { :$set => schema } )
  end

  def get_schema
    @env.params.send_table.merge!({
      :group  => @env.params.group_name,
      :removed => false
    })
  end

end