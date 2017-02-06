# encoding: UTF-8

a = ["Hell","Hello.rb"]
b = "Hello.rb"

if b =~ /^[A-Z][A-Za-z]{1,256}\.rb$/ and !a.include?(b)
  puts "Was true!"
else
  puts "Was false!"
end

aa = 12
bb = 12
cc = 16
dd = 13
if aa == bb and cc == (aa==dd ? cc : aa)
  puts 'yes'
else
  puts 'no'
end


options = {:data=> {:a=>'b'},:static=>false}


if options[:static] == false
  puts 'static true'
else 
  puts 'static false'
end