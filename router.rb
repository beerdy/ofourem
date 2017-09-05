module Router
  class << self
    def to way
      case way
      when /^\/$/
        'index'       
      when /^\/element_read$/
        'element_add'
      when /^\/elements_read$/
        'elements_read'
      when /^\/property_frontend$/
        'property_frontend'
      when /^\/user$/
        'user'
      else
        'error'
      end
      # < end static page
    end
  end
end