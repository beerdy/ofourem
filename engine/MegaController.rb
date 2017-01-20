# encoding: UTF-8

class MegaController

  attr_reader :env
  
  include RenderPage

  
  # > static page  
  def index
    render_page
  end
  def admin
    render_page({
      :page_htm => './view/admin.htm'
    })
  end
  def user
    render_page({
      :page_htm => './view/user.htm'
    })
  end
  # < end static page


  def poll_add
    obj_tags = TagsAdd.new()
    obj_tags.dothis

    obj_image = ImageAdd.new()
    obj_image.poll_add

    obj_poll_add = PollAdd.new()
    obj_poll_add.dothis
    
    if obj_poll_add.ok then @meta.poll_add else @downgrade.poll.add


      

    



    render_page({
      :data => @result.data
    })
  end
  def poll_read
  end
  def send_list
    obj_send_list = SendList.new( @env )
    obj_send_list.send_list

    render_page({
      :data => obj_send_list.result
    })
  end

  def error(message)
    render_page({ 
      :data   => message,
      :static => @env.json.nil?
    })
  end
end