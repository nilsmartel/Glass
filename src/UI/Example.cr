
require "./Widget"

module Glass
    property background_color : SF::Color

	class Example < Widget
		@width = 64_u32
		@height= 64_u32

		def initialize(@background_color : SF::Color)
		end
	end
end
