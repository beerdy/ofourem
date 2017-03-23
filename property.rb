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
          # struct
          :text => {
            :necessarily => true,
            :range_length => [3,7]#[3,264]
          },
          # struct
          :field => {
            :range_count => [2,5],
            :range_length => [1,50]
          }
        }
      }
    }
  end
end