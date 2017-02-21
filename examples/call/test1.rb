
fine = lambda do 
  'pppp'+a
end

def some
  a = '5'
  yield
end

puts some(&fine)


def element
  {
    :element => {
      :add => {
        :text => {
          :necessarily => true,
          :max_length => 264,
          :min_length => 2
        },  
        :field => {
          :min_count => 2,
          :max_length => 50,
          :min_length => 1
        }
      }
    }
  }
end

def props
  yield necessarily
end
def errors
end