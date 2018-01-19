require "../Color"
require "../Point"

struct Image
	property width : UInt32
	property height : UInt32
	@data : Array(Color)

	def initialize(@width, @height)
		@data = Array.new(width * height) { Color.new() }
	end

	def setPixel(x, y : Int, c : Color)
		@data[x % width + y*width] = c
	end
end

struct ImageClip

end
