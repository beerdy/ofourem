class VkontakteRu
  def initialize env
    @env = env
  end
  def vk_auth
    VkontakteApi.authorization_url(scope: [:friends, :photos])
  end
  def vk_verify
    @env.json
  end
end