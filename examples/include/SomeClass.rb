# encoding: UTF-8

class SomeClass
  def initialize
    @message = {:error => 'SORY no HEAD...'}
  end
  def show_head
  	render :json => @message 
  	puts "//=================HEAD============//"
  end
end