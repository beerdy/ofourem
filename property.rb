# encoding: UTF-8

module Property
  def property(type='backend')
    case type
    when 'backend'
      #property_json
      DeepStruct.new(property_json)
    when 'frontend'
      property_json
    end
  end
  # Private improvise method
  def property_json
    {
      :element => {
        :add => {
          :text => {
            :necessarily => true,
            :max_length => 264,
            :min_length => 3
          },  
          :field => {
            :min_count => 2,
            :max_count => 5,
            :max_length => 50,
            :min_length => 1
          }
        }
      }
    }
  end
end