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
            :id => 't1',
            :necessarily => true,
            :range_length => [3,7]#[3,264]
          },
          # struct
          :field => {
            :id_prefix => 'f',
            :range_count => [3,5],
            :range_length => [1,50]
          }
        },
        :read => {
          :limit => 12
        }
      }
    }
  end
end