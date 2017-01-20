# encoding: UTF-8

class ExampleClass
  def initialize
    @message = { :info => some_method }
  end
  def some_method
    '!!!WARNING!!! very strong informations'
  end
  def show_admin(number)
    puts "Admin runing..."
    render :json => @message if number == 5
    puts "Admin successfull terminated with result"
  end
end
