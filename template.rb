# encoding: UTF-8

=begin
  :meta    => 
  :scripts => 
  :styles  => 
  :header  =>
  :content => 
  :footer  => 
=end

PATH_VIEW = 'view'

module Template
  class MakePages
    def self.all
      pages = {}
      shared = `ls #{PATH_VIEW}/`.split("\n")
      shared.each_with_index do |md,index|
        page = shared[index][0..-9]
        pages[page] = IO.read("./#{PATH_VIEW}/#{page}.htm.erb",:encoding => 'UTF-8')
      end
      return pages
    end
  end
end

#Template::MakePages.all