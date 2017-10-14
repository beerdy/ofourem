# encoding: UTF-8

include Template
include Property

module OptionsProject
  def init_o4 locale
    locale = YAML::load( File.read('./locale/'+locale+'.yml',:encoding=>'UTF-8') )
    options = DeepStruct.new({
      :pp => property,
      :tt => locale,

      :auth => {
        :simple => true,
      },
      :template => {
        :page => Template::MakePages.all
      },

      # shared project options
      :enviroment_name => 'dev',
      :prefix          => 'o4em30',
      :rev_project     => 'r1-0',

      # db options
      :db => {
        :ip_v4         => '127.0.0.1',
        :port          => '27017',
        :max_pool_size => 10
        # можно nil тогдп генериться автоматом или неуказывать
        # :db_name => nil
      },

      # poll options
      :poll => {
        :extensions => [PermessageDeflate], 
        :ping => 5
      },

      # log options
      :log => {
        :level => 1
      },

      #F
      :frontend => {
        :pp => nil,
        :tt => nil
      }
    })

    # Property переименован в pp  т/к/ какимто чудом он сразу ДипиТься по имени
    #Выходит что имя включаемого метода должно отличаться от ключа прииемника структуры для Дипа
    #locale аналогично
    options.frontend.pp = property 'frontend'
    options.frontend.tt = locale

    return options

  end
end