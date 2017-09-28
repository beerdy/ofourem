module One
  module Two
    module Three
      def dodo
        'dodo some'
      end
      extend self
    end
  end
end

module OneTwo; include One::Two; end

puts OneTwo::Three.dodo