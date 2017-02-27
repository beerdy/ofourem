# encoding: UTF-8

module Property 
  def property(type='backend')
    case type
    when 'frontend'
      property_in_json
    when 'backend'
      DeepStruct.new(property_in_json)
    end
  end

##improvise design private type
  def property_in_json
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
            :max_count => 5,
            :max_length => 50,
            :min_length => 1
          }
        }
      }
    }
  end

end