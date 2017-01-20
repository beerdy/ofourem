# encoding: UTF-8

class BaseProject
  attr_reader :environment
  attr_accessor :env, :metadat, :resultat, :downgrade

  def initialize(environment)
    @environment = environment

    @env = Environment.new( environment )
    @metadat = MetaController.new( @env )
    @resultat = ResultController.new( @env )
    @downgrade = DowngradeController.new( @env )
  end
end