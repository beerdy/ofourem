# encoding: UTF-8

class MegaController < ControllerInitialize

  # > static page
  def index
    #render_page. тут static
    puts 'get index'
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
  
  # По умолчанию все читаем
  def element_read type='all'
    case type
    when condition
      
    end
  end

  def send_list
    obj_send_list = SendList.new( @env )
    obj_send_list.send_list

    render_page({
      :data => obj_send_list.result
    })
  end

  def error(message)
    render :content => { :page_htm => 'p404', :data=>{'page_not_found' => message[:info]} }
  end
end