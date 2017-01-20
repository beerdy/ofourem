{ :bool => true, :code => 9001, :info => "Попытка добавления списка завершена удачно" }
{ :bool => true, :code => 9002, :info => "Список \"#{@env.json['nameList']}\" успешно считан", :action => 'get_list' }
{ :bool => true, :code => 9003, :info => "Клиенты успешно считаны", :action => 'get_list', :props => @env.props.route( @env.json['nameList'] ) }
{ :bool => true, :code => 9004, :info => "Имена списков успешно считанны", :action => 'names_lists', :props  => @env.props.get, :names_lists => @result }
{ :bool => true, :code => 9005, :info => "Таблица успешно считана", :action => 'get_table', :props  => @env.props.get( table_name ), :table => @result[index] }
{ :bool => true, :code => 9006, :info => "Таблица успешно считана", :action => 'get_table', :props  => @env.props.get( table_name ), :table => @result[index] }
{ :bool => true, :code => 9007, :info => "Некоторые или все таблицы успешно считаны", :action => 'get_multi_table', :table => @result }
{ :bool => true, :code => 9008, :info => "Таблицы успешно протестированна", :action => 'get_multi_table' }
{ :bool => true, :code => 9010, :info => "Список \"#{list_name}\" успешно считан", :action => 'get_list', :props => @env.props.get( list_name ) }
{ :bool => true, :code => 9011, :info => "Некоторые или все списки успешно считаны", :action => 'get_multi_table', :lists => @result  }
{ :bool => true, :code => 9012, :action => 'send_table', :info => "Попытка добавления данных в таблицу - #{@env.json['nameList']}, завершена успешно" }