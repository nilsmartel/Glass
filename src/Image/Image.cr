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
		if check_bounds x, y, width, height
			@data[x % width + y*width] = c
		end
	end

	def setPixel(pos : Point, c : Color)
		setPixel pos.x, pos.y, c
	end
end

struct ImageClip
	property pos : Point
	property width : UInt32
	property height : UInt32
	@image : Image

	def initialize(@image, @pos, @width, @height)
	end

	def setPixel(x, y : Int, c : Color)
		if check_bounds x, y, width, height
			image.setPixel(x, y, c)
		end
	end

	def setPixel(pos : Point, c : Color)
		setPixel pos.x, pos.y, c
	end
end

def check_bounds(pos : Point, width, height : Number) : Bool
	return check_bounds pos.x, pos.y, width, height
end

def check_bounds(x, y, width, height : Number) : Bool
	return !(x < 0 || x > width || y < 0 || y > height)
end
