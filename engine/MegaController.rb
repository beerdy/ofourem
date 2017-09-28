# encoding: UTF-8

class MegaController < ControllerInitialize

  def index
    render :index => true
  end

  def admin
    render :content => { :page_htm => 'admin' }
  end
 
  def user
    render :file => { :page_htm => 'user' }
  end

  def test_json
    some = {'some'=>'LARRRRRR: Л. Гузеева к/ф "СВ.Спальный вагон"'}
    render :content => { :data=>some }
  end

  def post_json
  end

  def element_add
    @env.issue.element_add @meta.element_add ElementAdd.new(@env).insert @is.element_add
  end
  
  def vk_verify
    #render :content => { :data=>VkontakteRu.new(@env).vk_auth }
    vk = VkontakteApi.authorize(code: @thin.env['request'].params['code'])
    #wall = vk.wall.get(owner_id: 4684420,count: 2)
    code = '
var post=API.wall.get({"owner_id":393858255,"offset":0,"count":100});
var len=post.length;
return post[2];'

    wall = vk.execute(code: code)
    some = {'some'=>'LARRRRRR: Л. Гузеева к/ф "СВ.Спальный вагон"'}
    render :file => { :page_htm => 'vk_verify', :data => { :code => some} }
  end

  def vk_auth
    render :content => { :data=>VkontakteRu.new(@env).vk_auth }
  end

  def elements_read type='all'
    case type
    when 'all'
      render :content => { :data=>ElementsRead.new(@env).all }
    end
  end

  def send_list
    obj_send_list = SendList.new( @env )
    obj_send_list.send_list

    render_page({
      :data => obj_send_list.result
    })
  end

  def error
    render :content => { :page_htm => 'p404', :data=>{'page_not_found' => @thin.env['REQUEST_PATH']} }
  end
end