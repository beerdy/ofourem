# encoding: UTF-8

module User
  
  # See №1,2
  class UserInit
    attr_accessor :nickname, :uid, :typeauth, :token

    private
      def template typeauth, nickname
        {
          :_id      => uid,
          :typeauth => typeauth,
          :token    => [token],
          :nickname => nickname
        }
      end
  end

  # 1. For guest
  class Guest < UserInit
    def create
      guestcount = db_project[:content].find_and_modify({ "$inc" => { guestcount: 1 }}, new: true, upsert: true )
      nickname   = typeauth+guestcount.to_s
    end
  end

  # 2. For register
  class Default < UserInit
    def create
      
    end
  end

  # UTILS >> for User operation
  module Utils

    # Generate Token
    module Token
      def make nickname, uid, typeauth, ip, agent
        Digest::MD5.hexdigest nickname+uid+typeauth+ip+agent
      end
      extend self
    end

    # SetCookie for client
    module CookieSimple
      def set nickname, uid, token, typeauth
        headers = {'Content-Type' => 'text/html', 'charset' => 'utf-8' }
        Rack::Utils.set_cookie_header!(headers, "nickname", {:value => nickname, :path => "/"})
        Rack::Utils.set_cookie_header!(headers, "uid",      {:value => uid,      :path => "/"})
        Rack::Utils.set_cookie_header!(headers, "token",    {:value => token,    :path => "/"})
        Rack::Utils.set_cookie_header!(headers, "typeauth", {:value => typeauth, :path => "/"})
        return headers
      end
      extend self
    end

  end
end



# ALIAS example for - User::Utils::Token.make convert to: UserUtils::Token.make - For Esthetic)))
module UserUtils; include User::Utils; end