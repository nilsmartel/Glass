require "../Color"
require "../Point"

# Struct to represent an sRGBA Image
struct Image
	property width : UInt32
	property height : UInt32
	@data : Array(Color)

	def initialize(@width, @height)
		@data = Array.new(width * height) { Color.new() }
	end

	def set_pixel(x, y : Int, c : Color)
		if check_bounds x, y, width, height
			@data[x % width + y*width] = c
		end
	end

	def set_pixel(pos : Point, c : Color)
		set_pixel pos.x, pos.y, c
	end

	# Returns an ImageClip pointing to the Image
	def to_clip() : ImageClip
		ImageClip.new(self, pos.new(0,0), width, height)
	end
end

# Represents an (Cropped) Sector from an Image
struct ImageClip
	property pos : Point
	property width : UInt32
	property height : UInt32
	@image : Image

	def initialize(@image, @pos, @width, @height)
	end

	def set_pixel(x, y : Int, c : Color)
		if check_bounds x, y, width, height
			image.set_pixel(x, y, c)
		end
	end

	def set_pixel(pos : Point, c : Color)
		set_pixel pos.x, pos.y, c
	end
end

def check_bounds(pos : Point, width, height : Number) : Bool
	return check_bounds pos.x, pos.y, width, height
end

def check_bounds(x, y, width, height : Number) : Bool
	return !(x < 0 || x > width || y < 0 || y > height)
end
