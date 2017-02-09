# encoding: UTF-8

class Events
  def json
    { :bool => false, :code => 8004, :info => 'Ошибка полученны данных от клиента в формате JSON' }
  end
end
