# encoding: UTF-8

class ControllerInitialize
  # То том виде, что полученно от клиента
  attr_reader :thin

  attr_accessor :env       # Валидные (обработанные) данные полученные от клиента и данные обрабатываемые между объектами
  attr_accessor :meta      # CURD мета информации (дополнительная информация в базу и дополнительные действия, к примеру: работа с пуллом)
  attr_accessor :issue     # Результаты выполнений
  attr_accessor :downgrade # Откат действий с базой, в том числе и meta
  
  def initialize(environment)
    @thin = ThinEnv.new(env)

    # валидируем и устанавливаем данные от клиента
    @env = Environment.new environment

    # все три контроллера работают с данными клиента которые мы и передаем им
    @meta = MetaController.new @env
    @issue = IssueController.new @env
    @downgrade = DowngradeController.new @env
  end
end

class ThinEnv
  attr_reader :env
  def initialize(env)
    @env = env
  end
end