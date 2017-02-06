# encoding: UTF-8

module Application
  def self.run
    o = ExampleClass.new()

    o.show_admin(5)

    puts "///Something info in END programm///"
  end
end