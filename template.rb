# encoding: UTF-8

=begin
  :meta    => 
  :scripts => 
  :styles  => 
  :header  =>
  :content => 
  :footer  => 
=end

module Template
  class MakePages
    def self.all
      pages = {}
      main = IO.read("./views/main/main.htm.erb",:encoding => 'UTF-8')

      shared = `ls -p views/ | grep -v /`.split("\n")
      shared.each_with_index do |md,index|
        file = shared[index][0..-9] # убираем .htm.erb
        page = IO.read("./views/#{file}.htm.erb",:encoding => 'UTF-8')
        
        # Если '<!DOCTYPE' то main layouts не подключаем
        pages[file] = page[0..8]=='<!DOCTYPE'? page : main.gsub('[[main]]',page)
      end
      return pages
    end
  end
end

#Template::MakePages.all