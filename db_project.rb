# encoding: UTF-8

module DbProject
  def init_db(settings_o4)
    
    # shared project settings_o4
    prefix          = settings_o4.prefix
    rev_project     = settings_o4.rev_project
    enviroment_name = settings_o4.enviroment_name

    # db settings_o4
    ip_v4         = settings_o4.db.ip_v4
    port          = settings_o4.db.port
    max_pool_size = settings_o4.db.max_pool_size

    db_name = settings_o4.db.db_name ? settings_o4.db.db_name : "#{prefix}_#{rev_project}_#{enviroment_name}"

    init_collections( Mongo::Client.new([ "#{ip_v4}:#{port}" ], :database => db_name, :max_pool_size => max_pool_size ) )
  end

  def init_collections(db_project)
    $db_project = db_project

    $authn_o4   = db_project[:authn]
    $element_o4 = db_project[:element]
  end
end