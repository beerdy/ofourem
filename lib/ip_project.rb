# encoding: UTF-8
  
class IPProject
  class << self
    def get_ip env
      # Пока толька для 4-ки
      get_ip_v4 env
    end

    private
      def get_ip_v4 env
        if env['HTTP_X_REAL_IP'].nil? then
          env['HTTP_X_FORWARDED_FOR'] #apache
        else
          env['HTTP_X_REAL_IP']       #nginx
        end
      end
      
      def get_ip_v6 env
      end
  end
end