# encoding: UTF-8

class BaseProject
  # То что в чистом виде полученно от клиента
  attr_reader :environment

  attr_accessor :env, :metadat, :resultat, :downgrade

  def initialize(environment)
    @environment = environment

    # с этим envoroment работаем как с переменной env

    @env = Environment.new( environment )

    # все три контроллера работают с данными клиента которые мы и передаем им
    @metadat = MetaController.new( @env )
    @resultat = ResultController.new( @env )
    @downgrade = DowngradeController.new( @env )
  end
end