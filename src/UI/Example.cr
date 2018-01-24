
require "./Widget"

module Glass
	class Example < Widget
		@width = 64_u32
		@height= 64_u32

		def initialize(@background_color : SF::Color)
		end

		def initialize(r, g, b : UInt8)
			@background_color = SF::Color.new r, g, b
		end
	end
end
