# encoding: UTF-8

class MegaController < ControllerInitialize

  # > static page
  def index
    #render_page. тут static
    render :index => true
  end

  def admin
    #render_page. тут static
    render :content => { :page_htm => 'admin' }
  end
 
  def user
    render :file => { :page_htm => 'user' }
  end
  # < end static page

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
    puts "WALL====================================: #{wall}"
    render :file => { :page_htm => 'vk_verify', :data => {'code'=>JSON.parse([wall.to_json].to_json).first} }
  end
  def vk_auth
    render :content => { :data=>VkontakteRu.new(@env).vk_auth }
  end
=begin
  def element_add_
    obj_tags = TagsAdd.new()
    obj_tags.dothis

    obj_image = ImageAdd.new()
    obj_image.element_add

    obj_element_add = elementAdd.new()
    obj_element_add.dothis

    if obj_element_add.ok then @meta.element_add else @downgrade.element.add end

    render_page({
      :data => @result.data
    })
  end
=end
  

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