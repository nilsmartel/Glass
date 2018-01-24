
require "./Widget"

module Glass
	class Example < Widget
		@width = 64_u32
		@height= 64_u32

		def initialize(@image, @background_color : SF::Color)
		end
	end
end
