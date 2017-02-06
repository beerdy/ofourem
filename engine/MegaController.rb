# encoding: UTF-8

class MegaController
  attr_reader :env
  #include RenderPage
  def initialize(env)
    
  end
  # > static page
  def index
    #render_page
    render :index => true
  end
 
  def admin
    render :file => { :page_htm => 'admin' }
  end
 
  def user
    render :file => { :page_htm => 'user' }
  end
  # < end static page

  def element_add
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

  def element_read
  end

  def send_list
    obj_send_list = SendList.new( @env )
    obj_send_list.send_list

    render_page({
      :data => obj_send_list.result
    })
  end

  def error(message)
    render :file => { :page_htm => '404', :data=>{'page_not_found' => message[:info]} }
  end
end