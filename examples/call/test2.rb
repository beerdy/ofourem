json = {
  'text' => 'Кто такой джон галт?',
  'f1' => '1. Герой романа;',
  'f2' => '2. Бизнесмен;',
  'f3' => '3. Работник метро'
}

tt = lambda do |key,value|
  puts "#{key}=>#{value}"
  return if key == 'f1'
end
json.map(&tt)