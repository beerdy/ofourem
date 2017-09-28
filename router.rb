# encoding: UTF-8

module Router
  class << self
    def to mcontroller, uri
      case uri
      when /^\/$/
        mcontroller.index
      when /^\/element_add$/
        mcontroller.element_add
      when /^\/elements_read$/
        mcontroller.elements_read
      when /^\/property_frontend$/
        mcontroller.property_frontend
      when /^\/user/
        mcontroller.user
      when /^\/vk_auth$/
        mcontroller.vk_auth
      when /^\/vk_verify/
        mcontroller.vk_verify
      when /^\/test_json/
        mcontroller.test_json
      else
        mcontroller.error
      end
    end
  end
end