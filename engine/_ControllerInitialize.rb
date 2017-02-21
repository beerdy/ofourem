# encoding: UTF-8

class ControllerInitialize
  # То том виде, что полученно от клиента
  attr_reader :thin

  attr_accessor :env       # Валидные (обработанные) данные полученные от клиента и данные обрабатываемые между объектами
  attr_accessor :meta      # CURD мета информации (дополнительная информация в базу и дополнительные действия, к примеру: работа с пуллом)
  attr_accessor :issue     # Результаты выполнений
  attr_accessor :downgrade # Откат действий с базой, в том числе и meta
  
  def initialize(environment)
    @thin = ThinEnv.new(environment)

    # Валидируем и устанавливаем данные от клиента
    @env = Environment.new environment

    # Инициализация в порядке отработки
    @is = InspectionSet.new @env

    # Результаты доступны везде
    @env.issue = IssueController.new @env

    # -- TEMP -- Пока не дошел
    # -> сама модель
    @meta = MetaController.new @env
    @downgrade = DowngradeController.new @env
  end
end

class ThinEnv
  attr_reader :env
  def initialize(env)
    @env = env
  end
end