  # encoding: UTF-8

module Property
  def property
    DeepStruct.new({
      :element => {
        :add => {
          :text => {
            :necessarily => true,
            :max_length => 264,
            :min_length => 2
          },  
          :field => {
            :min_count => 2,
            :max_count => 5,
            :max_length => 50,
            :min_length => 1
          }
        }
      }
    })
  end
end