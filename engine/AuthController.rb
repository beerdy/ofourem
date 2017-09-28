# encoding: UTF-8

class AuthController
  attr_accessor :env
  include UserUtils

  def initialize env
    @env = env
    # = env['request'].cookies['nickname']
    # = env['request'].cookies['uid']
    # = env['request'].cookies['token']
    # = env['request'].cookies['typeauth']
  end
 
  def router typeauth
    case typeauth
    when nil
      uid   = BSON::ObjectId.new()
      token = UserUtils::Token.make nickname, uid, typeauth, @env.client.ip, @env.client.agent

      user = User::Create.new()
      user.typeauth = 'guest'
      user.uid = uid
      user.token = token
      user.create


      guest nickname, uid, typeauth, token
    when 'sign'
    when 'reg'
    when 'guest'
    when 'default'
    end
  end

end